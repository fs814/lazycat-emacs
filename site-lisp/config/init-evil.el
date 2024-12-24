(require 'evil)
(evil-mode 1)

(lazy-load-global-keys
  '(
    ("C-g" . evil-force-normal-state)
    ("C-c" . evil-force-normal-state)
    ("C-l" . evil-window-right)
    ("C-h" . evil-window-left)
    ("C-j" . evil-window-down)
    ("C-k" . evil-window-up)
    )
  "init-evil")

(provide 'init-evil)
