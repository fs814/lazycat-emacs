(require 'evil)
(evil-mode 1)

(lazy-load-global-keys
    '(
        ("C-g" . evil-force-normal-state)
    )
"init-evil")

(provide 'init-evil)

