(cond (IS-WINDOWS
        (setq fsdir-base-dir "C:/"))
        (IS-MAC
        (setq fsdir-base-dir (expand-file-name "/Users/fs814/")))
        (IS-LINUX
        (setq fsdir-base-dir (expand-file-name "~/")))
)

(setq fsdir-tmp-dir (concat fsdir-base-dir "tmp/"))
(setq fsdir-tmp-slack-dir (concat fsdir-tmp-dir "slack/"))

(setq fsdir-selfdoom-dir (concat fsdir-base-dir "sourcecode/doom-emacs/"))
(setq fsdir-selfdoom-modules-dir (concat fsdir-selfdoom-dir "modules/"))

(setq fsdir-download-dir fsdir-base-dir)
(setq fsdir-storage-dir (expand-file-name "~/storage/"))
(setq fsdir-sourcenew-dir (concat fsdir-base-dir "sourcenew/"))
(setq fsdir-docsets-dir (concat fsdir-base-dir "docsets/"))
(when IS-MAC
  (setq fsdir-docsets-dir "/Users/fs814/Library/Application Support/Dash/DocSets/"))

(setq magic-mode-alist nil)

(defun fsdir-cheatsheet-keyword ()
  (interactive)
  (setq keyword (ivy-read "keyword: " nil))
  (setq file (ivy-read "keyword: " (directory-files-recursively fsdir-settings-cheat-dir keyword)))
  (find-file file)
  )

(setq fsdir-emacs-extensions-dir (concat fsdir-selfdoom-modules-dir "extensions/"))
(add-to-list 'load-path fsdir-emacs-extensions-dir)

(defmacro fsdir-filelist (group)
  (let (
        (_fsdir--filelist (intern (format "fsdir-%s-filelist" group)))
        )
    `(progn
       (setq ,_fsdir--filelist nil)
       (fsdir-open-define ,group ,_fsdir--filelist)
       )
    )
  )

(defmacro fsdir-setq (group name dir)
  (let (
        (_fsdir--filelist (intern (format "fsdir-%s-filelist" group)))
        (_fsdir--dir (intern (format "fsdir-%s-%s-dir" group name)))
        (_fsdir--dir-empty (intern (format "fsdir-%s-dir" group)))
        )
    `(progn
       (if (string= ,name "")
           (setq ,_fsdir--dir-empty ,dir)
         (setq ,_fsdir--dir ,dir))
       (setq ,_fsdir--filelist (append ,_fsdir--filelist (list (cons (concat ,group "-" ,name) ,dir))))
       ;;(setq _fsdir--var dir)
       ;;(setq _fsdir--filelist (concat (concat group "-" name) dir))
       )
    )
  )

(defmacro fsdir-goto-define (name dir)
  (let ((fn-goto (intern (format "+fsdir/goto-%s-dir" name)))
        )
    `(progn
       (defun ,fn-goto ()
         (interactive)
         (dired ,dir)))))

(defmacro fsdir-open-define (name dir)
  (if (eval name)
      (setq name (eval name))
    (setq name name)
    )
  ;;(message (concat "new-name:" name))
  (let ((fn-open (intern (format "+fsdir/open-%s-dir" name)))
        )
    `(progn
       (defun ,fn-open ()
         (interactive)
         (let ((abbrevCode
                (ido-completing-read "Open:" (mapcar (lambda (x) (car x)) ,dir))))
           (find-file (cdr (assoc abbrevCode ,dir))))
         ))))

(load! "+sourcecode")
(load! "+macrodefine")

(load! "+arttools")
(load! "+blender")
(load! "+buildtools")
(load! "+chezmoi")
(load! "+config")
(load! "+docker")
(load! "+doom")
(load! "+download")
(load! "+llvm")
(load! "+myproject")
(load! "+neovim")
(load! "+powershell")
;;(load! "+weiyun")
;;(load! "+rocom")
(load! "+settings")
(load! "+ta")
(load! "+codeset")
(load! "+macos")
(load! "+markdown")
(load! "+vim")
(load! "+windows")
(load! "+workunity")
(load! "+workunreal")
(load! "+nextcloud")
(load! "+doublecmd")

(load! "+bindings")

(provide 'init-fsdir)
