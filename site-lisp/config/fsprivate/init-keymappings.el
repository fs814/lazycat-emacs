;;; init-keymappings.el --- Git and crunner keybindings -*- lexical-binding: t; -*-
;;
;; Ported from lunarvim/lua/fsmappings.lua

;;; Git - open magit-status in specific directories (Neogit equivalent)
(defun +magit-status-in (dir)
  "Open magit-status in DIR."
  (let ((default-directory dir))
    (magit-status)))

(global-set-key (kbd "C-x g c") (lambda () (interactive) (+magit-status-in (expand-file-name "~/sourcecode/Settings/"))))
(global-set-key (kbd "C-x g d") (lambda () (interactive) (+magit-status-in (expand-file-name "~/sourcecode/doom-emacs/"))))
(global-set-key (kbd "C-x g e") (lambda () (interactive) (+magit-status-in (expand-file-name "~/sourcecode/gameengine/UnrealEngine/"))))
(global-set-key (kbd "C-x g j") (lambda () (interactive) (+magit-status-in (expand-file-name "~/sourcecode/myproject/jupyter/"))))
(global-set-key (kbd "C-x g l") (lambda () (interactive) (+magit-status-in (expand-file-name "~/sourcecode/emacsconf/lazycat-emacs/"))))
(global-set-key (kbd "C-x g L") (lambda () (interactive) (+magit-status-in (expand-file-name "~/sourcecode/Settings/lunarvim/"))))
(global-set-key (kbd "C-x g m") (lambda () (interactive) (+magit-status-in (expand-file-name "~/sourcecode/mobileorg/"))))
(global-set-key (kbd "C-x g x") (lambda () (interactive) (+magit-status-in (expand-file-name "~/sourcenew/myproject/cleancode/"))))
(global-set-key (kbd "C-x g M") (lambda () (interactive) (+magit-status-in (expand-file-name "~/sourcenew/myproject/MonoRepo/"))))
(global-set-key (kbd "C-x g C") (lambda () (interactive) (+magit-status-in (expand-file-name "~/.local/share/chezmoi/"))))
(global-set-key (kbd "C-x g w") (lambda () (interactive) (+magit-status-in (expand-file-name "~/sourcecode/myproject/llmwiki/"))))

;;; Evil keybindings for git and crunner
(with-eval-after-load 'evil
  (evil-define-key 'normal 'global
    (kbd ",gc") (lambda () (interactive) (+magit-status-in (expand-file-name "~/sourcecode/Settings/")))
    (kbd ",gd") (lambda () (interactive) (+magit-status-in (expand-file-name "~/sourcecode/doom-emacs/")))
    (kbd ",ge") (lambda () (interactive) (+magit-status-in (expand-file-name "~/sourcecode/gameengine/UnrealEngine/")))
    (kbd ",gj") (lambda () (interactive) (+magit-status-in (expand-file-name "~/sourcecode/myproject/jupyter/")))
    (kbd ",gl") (lambda () (interactive) (+magit-status-in (expand-file-name "~/sourcecode/emacsconf/lazycat-emacs/")))
    (kbd ",gL") (lambda () (interactive) (+magit-status-in (expand-file-name "~/sourcecode/Settings/lunarvim/")))
    (kbd ",gm") (lambda () (interactive) (+magit-status-in (expand-file-name "~/sourcecode/mobileorg/")))
    (kbd ",gx") (lambda () (interactive) (+magit-status-in (expand-file-name "~/sourcenew/myproject/cleancode/")))
    (kbd ",gM") (lambda () (interactive) (+magit-status-in (expand-file-name "~/sourcenew/myproject/MonoRepo/")))
    (kbd ",gC") (lambda () (interactive) (+magit-status-in (expand-file-name "~/.local/share/chezmoi/")))
    (kbd ",gw") (lambda () (interactive) (+magit-status-in (expand-file-name "~/sourcecode/myproject/llmwiki/")))))

(provide 'init-keymappings)
