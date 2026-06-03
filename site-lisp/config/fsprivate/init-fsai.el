;;; init-fsai.el --- AI assistant configuration -*- lexical-binding: t; -*-
;;
;; AI integration using claude-internal, gemini-internal, codex-internal
;; Mirrors lunarvim/lua/fsai.lua codecompanion setup

;;; Require
(require 'gptel nil t)
(require 'gptel-curl nil t)
(require 'shell-maker nil t)
(require 'acp nil t)
(require 'agent-shell nil t)

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

;;; Agent-shell: ACP-based native emacs UI for codebuddy / gemini-internal
;; Internal Gemini binary differs from upstream default ("gemini")
(with-eval-after-load 'agent-shell
  (setq agent-shell-google-gemini-acp-command
        '("gemini-internal" "--experimental-acp"))
  ;; Claude Code speaks ACP via the @zed-industries/claude-code-acp bridge
  ;; (binary `claude-code-acp`); the `claude` CLI itself has no --acp flag.
  (setq agent-shell-anthropic-claude-acp-command
        '("claude-code-acp")))
;; CodeBuddy default ("codebuddy" "--acp") matches local install, no override needed

;;; AI CLI session commands
;; The launch script may rebind HOME to a config-only directory; AI CLIs read
;; their tokens from the real HOME, so restore it from REALHOME for subprocesses.
(defun +ai/run-cli (cmd)
  "Run CMD in eaf-pyqterminal with HOME restored from REALHOME."
  (let* ((real-home (or (getenv "REALHOME") (expand-file-name "~")))
         (process-environment (cons (concat "HOME=" real-home) process-environment)))
    (eaf-pyqterminal-run-command-in-dir cmd default-directory t)))

(defun +ai/claude-internal ()
  "Start a new claude-internal session in eaf-pyqterminal."
  (interactive)
  (+ai/run-cli "claude-internal"))

(defun +ai/gemini-internal ()
  "Start a new gemini-internal session in eaf-pyqterminal."
  (interactive)
  (+ai/run-cli "gemini-internal --experimental-acp"))

(defun +ai/codex-internal ()
  "Start a new codex-internal session in eaf-pyqterminal."
  (interactive)
  (+ai/run-cli "codex-internal"))

(defun +ai/codebuddy ()
  "Start a new codebuddy session in eaf-pyqterminal."
  (interactive)
  (+ai/run-cli "codebuddy"))

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

;;; Agent-shell prompt actions
(defun +ai/agent-prompt (prompt-text)
  "Send the current region with PROMPT-TEXT to agent-shell."
  (let* ((shell-buffer (agent-shell--shell-buffer :no-error t :no-create t))
         (region-context (agent-shell--get-region-context
                          :deactivate t
                          :agent-cwd (when shell-buffer
                                       (with-current-buffer shell-buffer
                                         (agent-shell-cwd))))))
    (unless shell-buffer
      (agent-shell))
    (setq shell-buffer (agent-shell--shell-buffer :no-error t))
    (agent-shell-insert
     :text (concat prompt-text "\n\n" region-context)
     :submit t
     :shell-buffer shell-buffer)))

(defun +ai/explain-code ()
  "Explain selected code via agent-shell."
  (interactive)
  (+ai/agent-prompt "请解释选中的代码，说明其功能和逻辑"))

(defun +ai/add-comments ()
  "Add comments/docs to selected code via agent-shell."
  (interactive)
  (+ai/agent-prompt "请为选中的代码补全注释和文档"))

(defun +ai/optimize-code ()
  "Optimize selected code via agent-shell."
  (interactive)
  (+ai/agent-prompt "请优化选中的代码，提升可读性和性能"))

(defun +ai/generate-tests ()
  "Generate unit tests for selected code via agent-shell."
  (interactive)
  (+ai/agent-prompt "请为选中的代码生成单元测试"))

(defun +ai/find-bugs ()
  "Find bugs in selected code via agent-shell."
  (interactive)
  (+ai/agent-prompt "请定位选中代码中的潜在缺陷和问题"))

;;; Evil keybindings
(with-eval-after-load 'evil
  (evil-define-key 'normal 'global
    (kbd ",an") #'+ai/claude-internal
    (kbd ",ag") #'+ai/gemini-internal
    (kbd ",ax") #'+ai/codex-internal
    (kbd ",ab") #'+ai/codebuddy
    (kbd ",ac") #'+ai/chat
    (kbd ",as") #'+ai/send-region
    (kbd ",aa") #'+ai/aider
    (kbd ",ar") #'gptel-rewrite
    (kbd ",aAs") #'agent-shell
    (kbd ",aAc") #'agent-shell-codebuddy-start-agent
    (kbd ",aAg") #'agent-shell-google-start-gemini
    (kbd ",aAl") #'agent-shell-anthropic-start-claude-code)
  (evil-define-key 'visual 'global
    (kbd ",aAE") #'+ai/explain-code
    (kbd ",aAD") #'+ai/add-comments
    (kbd ",aAO") #'+ai/optimize-code
    (kbd ",aAT") #'+ai/generate-tests
    (kbd ",aAF") #'+ai/find-bugs))

(provide 'init-fsai)
;;; init-fsai.el ends here
