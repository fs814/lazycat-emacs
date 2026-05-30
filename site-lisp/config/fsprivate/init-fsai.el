;;; init-fsai.el --- AI assistant configuration -*- lexical-binding: t; -*-
;;
;; AI integration using claude-internal, gemini-internal, codex-internal
;; Mirrors lunarvim/lua/fsai.lua codecompanion setup

;;; Require
(require 'gptel nil t)
(require 'gptel-curl nil t)

;;; Code:

;; OpenRouter backend
(defvar open-router-key
  (let ((key-file (expand-file-name "~/.config/openrouter/key.txt")))
    (if (file-exists-p key-file)
        (with-temp-buffer
          (insert-file-contents key-file)
          (string-trim (buffer-string)))
      "")))

(setq gptel-model "anthropic/claude-sonnet-4-20250514"
      gptel-backend
      (gptel-make-openai "OpenRouter"
        :host "openrouter.ai"
        :endpoint "/api/v1/chat/completions"
        :stream t
        :key open-router-key
        :models '("anthropic/claude-sonnet-4-20250514"
                  "anthropic/claude-3.5-sonnet"
                  "google/gemini-2.5-pro")))

;;; Aidermacs with claude-internal
(require 'aidermacs nil t)
(setq aidermacs-program "claude-internal")
(setq aidermacs-default-model "claude-sonnet-4-20250514")

;;; AI CLI session commands
(defun +ai/claude-internal ()
  "Start a new claude-internal session in eaf-pyqterminal."
  (interactive)
  (eaf-pyqterminal-run-command-in-dir "claude-internal" default-directory t))

(defun +ai/gemini-internal ()
  "Start a new gemini-internal session in eaf-pyqterminal."
  (interactive)
  (eaf-pyqterminal-run-command-in-dir "gemini-internal --experimental-acp" default-directory t))

(defun +ai/codex-internal ()
  "Start a new codex-internal session in eaf-pyqterminal."
  (interactive)
  (eaf-pyqterminal-run-command-in-dir "codex-internal" default-directory t))

;;; Interactive commands
(defun +ai/chat ()
  "Start AI chat with gptel."
  (interactive)
  (gptel "AI Chat" nil nil t))

(defun +ai/send-region ()
  "Send region to AI."
  (interactive)
  (gptel-send))

(defun +ai/aider ()
  "Start aider session."
  (interactive)
  (aidermacs-start))

;;; Evil keybindings
(with-eval-after-load 'evil
  (evil-define-key 'normal 'global
    (kbd ",an") #'+ai/claude-internal
    (kbd ",ag") #'+ai/gemini-internal
    (kbd ",ax") #'+ai/codex-internal
    (kbd ",ac") #'+ai/chat
    (kbd ",as") #'+ai/send-region
    (kbd ",aa") #'+ai/aider
    (kbd ",ar") #'gptel-rewrite))

(provide 'init-fsai)
;;; init-fsai.el ends here
