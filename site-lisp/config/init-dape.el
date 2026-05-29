;;; init-dape.el --- DAP debug configuration for dape -*- lexical-binding: t; -*-
;;
;; DAP debug support for C/C++, Python, Go, Rust, Java, JS/TS
;; Ported from lunarvim/lua/users/dap-configs/
;; Uses `crunner` to compile with debug symbols and get output path.

(require 'dape)

;; General settings
(setq dape-buffer-window-arrangement 'right
      dape-inlay-hints t)

;; Persist breakpoints across sessions
(dape-breakpoint-global-mode 1)

;;; crunner integration
(defun +dape--crunner-program ()
  "Compile current file with debug symbols via crunner and return output path."
  (let ((file (buffer-file-name)))
    (unless file (user-error "Buffer has no file"))
    (message "crunner: compiling %s..." (file-name-nondirectory file))
    (shell-command-to-string (format "crunner dbg %s" (shell-quote-argument file)))
    (string-trim (shell-command-to-string
                  (format "crunner file %s" (shell-quote-argument file))))))

;; C/C++ via lldb-dap (from Xcode or LLVM)
(when (eq system-type 'darwin)
  (let ((lldb-dap-path
         (cond
          ((file-exists-p "/Applications/Xcode.app/Contents/Developer/usr/bin/lldb-dap")
           "/Applications/Xcode.app/Contents/Developer/usr/bin/lldb-dap")
          ((file-exists-p "/opt/homebrew/opt/llvm/bin/lldb-dap")
           "/opt/homebrew/opt/llvm/bin/lldb-dap")
          (t nil))))
    (when lldb-dap-path
      (add-to-list 'dape-configs
                   `(lldb-dap-cc
                     modes (c-mode c-ts-mode c++-mode c++-ts-mode objc-mode)
                     command ,lldb-dap-path
                     :type "lldb-dap"
                     :request "launch"
                     :cwd dape-cwd
                     :program +dape--crunner-program
                     :args []
                     :initCommands ["process handle SIGTRAP -n true -p true -s false"
                                    "process handle SIGBUS  -n true -p true -s false"]
                     :stopOnEntry nil))
      ;; Rust shares the same adapter
      (add-to-list 'dape-configs
                   `(lldb-dap-rust
                     modes (rust-mode rust-ts-mode)
                     command ,lldb-dap-path
                     :type "lldb-dap"
                     :request "launch"
                     :cwd dape-cwd
                     :program +dape--crunner-program
                     :args []
                     :initCommands ["process handle SIGTRAP -n true -p true -s false"
                                    "process handle SIGBUS  -n true -p true -s false"]
                     :stopOnEntry nil)))))

;; C/C++/Rust via codelldb (alternative)
(when-let* ((codelldb (executable-find "codelldb")))
  (add-to-list 'dape-configs
               `(codelldb-cc
                 modes (c-mode c-ts-mode c++-mode c++-ts-mode rust-mode rust-ts-mode)
                 command ,codelldb
                 command-args ("--port" :autoport)
                 :type "lldb"
                 :request "launch"
                 :cwd dape-cwd
                 :program +dape--crunner-program
                 :args []
                 :initCommands ["process handle SIGTRAP -n true -p true -s false"
                                "process handle SIGBUS  -n true -p true -s false"]
                 :stopOnEntry nil
                 port :autoport)))

;; Python via debugpy (install: pip install debugpy)
(add-to-list 'dape-configs
             `(debugpy
               modes (python-mode python-ts-mode)
               command "python3"
               command-args ("-m" "debugpy.adapter")
               :type "executable"
               :request "launch"
               :cwd dape-cwd
               :program dape-buffer-default
               :args []
               :stopOnEntry nil))

;; Go via dlv (install: go install github.com/go-delve/delve/cmd/dlv@latest)
(when-let* ((dlv-path (or (executable-find "dlv")
                          (let ((p (expand-file-name "~/sourcecode/gopath/bin/dlv")))
                            (when (file-exists-p p) p)))))
  (add-to-list 'dape-configs
               `(delve
                 modes (go-mode go-ts-mode)
                 command ,dlv-path
                 command-args ("dap" "--listen" "127.0.0.1::autoport")
                 :type "debug"
                 :request "launch"
                 :mode "exec"
                 :cwd dape-cwd
                 :program +dape--crunner-program
                 port :autoport)))

;; Java via jdtls debug adapter
(add-to-list 'dape-configs
             `(jdtls
               modes (java-mode java-ts-mode)
               :request "launch"
               :type "java"
               :cwd dape-cwd
               :mainClass ""
               :args ""))

;; JavaScript/TypeScript via js-debug
(let ((js-debug-path (expand-file-name "~/.local/share/js-debug/src/dapDebugServer.js")))
  (when (file-exists-p js-debug-path)
    (add-to-list 'dape-configs
                 `(js-debug-node
                   modes (js-mode js-ts-mode typescript-mode typescript-ts-mode)
                   command "node"
                   command-args (,js-debug-path :autoport)
                   :type "pwa-node"
                   :request "launch"
                   :cwd dape-cwd
                   :program dape-buffer-default
                   :console "integratedTerminal"
                   port :autoport))
    (add-to-list 'dape-configs
                 `(js-debug-chrome
                   modes (js-mode js-ts-mode typescript-mode typescript-ts-mode)
                   command "node"
                   command-args (,js-debug-path :autoport)
                   :type "pwa-chrome"
                   :request "launch"
                   :url "http://localhost:3000"
                   :webRoot dape-cwd
                   port :autoport))))

;;; crunner build/run commands
(defun +crunner-build ()
  "Build current file via crunner."
  (interactive)
  (compile (format "crunner build %s" (shell-quote-argument (buffer-file-name)))))

(defun +crunner-dbg ()
  "Compile current file with debug symbols via crunner."
  (interactive)
  (compile (format "crunner dbg %s" (shell-quote-argument (buffer-file-name)))))

(defun +crunner-run ()
  "Build and run current file via crunner."
  (interactive)
  (compile (format "crunner run %s" (shell-quote-argument (buffer-file-name)))))

;;; Unreal Engine debug target selector
(defun +crunner-unreal-debug ()
  "Select and launch an Unreal Engine debug target via dape."
  (interactive)
  (let* ((unreal-dir (cond
                      ((file-directory-p "/Users/fs814/sourcecode/gameengine/UnrealEngine")
                       "/Users/fs814/sourcecode/gameengine/UnrealEngine")
                      ((file-directory-p "/Users/fs814/sourcenew/gameengine/UnrealEngine")
                       "/Users/fs814/sourcenew/gameengine/UnrealEngine")
                      (t (user-error "UnrealEngine directory not found"))))
         (targets
          `(("UE5BlankCpp Editor"
             :program "/Users/fs814/sourcecode/gameengine/UE5BlankCpp/Binaries/Mac/UE5BlankCppEditor-Mac-Debug.app/Contents/MacOS/UE5BlankCppEditor-Mac-Debug"
             :args ["/Users/fs814/sourcecode/gameengine/UE5BlankCpp/UE5BlankCpp.uproject"]
             :cwd ,unreal-dir)
            ("UE5First (UnrealEditor)"
             :program ,(concat unreal-dir "/Engine/Binaries/Mac/UnrealEditor-Mac-Debug.app/Contents/MacOS/UnrealEditor-Mac-Debug")
             :args ["/Users/fs814/sourcecode/gameengine/UE5BlankCpp/UE5First.uproject"]
             :cwd ,unreal-dir)
            ("UE5Third (UnrealEditor)"
             :program ,(concat unreal-dir "/Engine/Binaries/Mac/UnrealEditor-Mac-Debug.app/Contents/MacOS/UnrealEditor-Mac-Debug")
             :args ["/Users/fs814/sourcecode/gameengine/UE5BlankCpp/UE5Third.uproject"]
             :cwd ,unreal-dir)
            ("UnrealEditor (standalone)"
             :program ,(concat unreal-dir "/Engine/Binaries/Mac/UnrealEditor-Mac-Debug.app/Contents/MacOS/UnrealEditor-Mac-Debug")
             :args []
             :cwd ,unreal-dir)
            ("SlateViewer"
             :program ,(concat unreal-dir "/Engine/Binaries/Mac/SlateViewer-Mac-Debug")
             :args []
             :cwd ,unreal-dir)))
         (labels (mapcar #'car targets))
         (choice (completing-read "Select Unreal debug target: " labels nil t))
         (target (assoc choice targets))
         (lldb-dap-path
          (cond
           ((file-exists-p "/Applications/Xcode.app/Contents/Developer/usr/bin/lldb-dap")
            "/Applications/Xcode.app/Contents/Developer/usr/bin/lldb-dap")
           ((file-exists-p "/opt/homebrew/opt/llvm/bin/lldb-dap")
            "/opt/homebrew/opt/llvm/bin/lldb-dap")
           (t (user-error "lldb-dap not found")))))
    (dape `(modes (c++-mode)
            command ,lldb-dap-path
            :type "lldb-dap"
            :request "launch"
            :program ,(plist-get (cdr target) :program)
            :args ,(plist-get (cdr target) :args)
            :cwd ,(plist-get (cdr target) :cwd)
            :initCommands ["process handle SIGTRAP -n true -p true -s false"
                           "process handle SIGBUS  -n true -p true -s false"]
            :stopOnEntry nil))))

;;; Keybindings
;; F-key bindings (IDE-style)
(global-set-key (kbd "<f5>") #'dape-continue)
(global-set-key (kbd "S-<f5>") #'dape-quit)
(global-set-key (kbd "C-S-<f5>") #'dape-restart)
(global-set-key (kbd "<f9>") #'dape-breakpoint-toggle)
(global-set-key (kbd "<f10>") #'dape-next)
(global-set-key (kbd "<f11>") #'dape-step-in)
(global-set-key (kbd "S-<f11>") #'dape-step-out)

;; Evil keybindings
(with-eval-after-load 'evil
  (evil-define-key 'normal 'global
    (kbd ",db") #'dape-breakpoint-toggle
    (kbd ",dB") #'dape-breakpoint-expression
    (kbd ",dd") #'dape
    (kbd ",dc") #'dape-continue
    (kbd ",dp") #'dape-pause
    (kbd ",di") #'dape-step-in
    (kbd ",do") #'dape-next
    (kbd ",dO") #'dape-step-out
    (kbd ",dr") #'dape-restart
    (kbd ",dl") #'dape-repl
    (kbd ",dk") #'dape-kill
    (kbd ",dt") #'dape-quit
    (kbd ",du") #'dape-info
    (kbd ",de") #'dape-evaluate-expression
    (kbd ",rb") #'+crunner-build
    (kbd ",rd") #'+crunner-dbg
    (kbd ",rr") #'+crunner-run
    (kbd ",ru") #'+crunner-unreal-debug))

(provide 'init-dape)
