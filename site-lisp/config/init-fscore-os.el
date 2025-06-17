(defconst IS-MAC   (eq system-type 'darwin))
(defconst IS-LINUX (eq system-type 'gnu/linux))
(defconst IS-WINDOWS (eq system-type 'windows-nt))
(defconst IS-WIN64P (and IS-WINDOWS (not (getenv "PROGRAMW6432"))))
(defconst IS-ANDROID (and IS-LINUX (string-match "Android" (shell-command-to-string "uname -a"))))
(defconst IS-LINUX-WIN (and IS-LINUX (string-match "Microsoft" (shell-command-to-string "uname -a"))))

(cond (IS-LINUX
       (setenv "SHELL" (executable-find "zsh"))
       (setq shell-file-name (executable-find "zsh")))
      (IS-WINDOWS))

(provide 'init-fscore-os)