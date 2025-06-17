;;; private/fsdir/+macrodefine.el -*- lexical-binding: t; -*-

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

(fsdir-goto-define "settings" fsdir-settings-dir)
(fsdir-goto-define "bin" fsdir-settings-bin-dir)
(fsdir-goto-define "conkeror" fsdir-settings-conkeror-dir)
(fsdir-goto-define "chezmoi" fsdir-chezmoi-dir)
(fsdir-goto-define "docker" fsdir-docker-dir)
(fsdir-goto-define "markdown" fsdir-markdown-dir)
(fsdir-goto-define "stumpwm" fsdir-settings-stumpwm-dir)
(fsdir-goto-define "vim" fsdir-settings-oldvim-dir)
(fsdir-goto-define "zsh" fsdir-settings-zsh-dir)

(fsdir-goto-define "sourcecode" fsdir-sourcecode-dir)
(fsdir-goto-define "editor-emacs" fsdir-sourcecode-editor-emacs-dir)
(fsdir-goto-define "editor-vim" fsdir-sourcecode-editor-vim-dir)
(fsdir-goto-define "gameengine-unrealengine" fsdir-sourcecode-gameengine-unrealengine-dir)
(fsdir-goto-define "sourcecode-linuxwin" fsdir-sourcecode-linuxwin-dir)
(fsdir-goto-define "vimconf-spacevim" fsdir-sourcecode-vimconf-spacevim-dir)

(fsdir-goto-define "sourcenew" fsdir-sourcenew-dir)

(fsdir-goto-define "doom" fsdir-doom-emacs-dir)
(fsdir-goto-define "doom-modules" doom-modules-dir)
(fsdir-goto-define "doom-packages" fsdir-doom-packages-dir)
(fsdir-goto-define "doom-private" fsdir-doom-private-dir)
(fsdir-goto-define "sourcecode-mobileorg" fsdir-sourcecode-mobileorg-dir)
(fsdir-goto-define "weiyun" fsdir-weiyun-dir)

(fsdir-goto-define "myproject-art" fsdir-myproject-art-dir)
(fsdir-goto-define "myproject-codeset" fsdir-myproject-codeset-dir)
(fsdir-goto-define "myproject-monorepo" fsdir-myproject-monorepo-dir)
(fsdir-goto-define "myproject-rabmono" fsdir-myproject-rabmono-dir)
(fsdir-goto-define "myproject-rabengine" fsdir-myproject-rabengine-dir)

