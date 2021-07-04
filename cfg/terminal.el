;;; ~/.emacs.d/cfg/terminal.el -*- lexical-binding: t; -*-

;;; Xclip.
;; Yank to clipboard in the terminal.
(straight-use-package 'xclip)
(xclip-mode +1)

;;; VTerm.
(straight-use-package 'vterm)
(evil-global-set-key 'normal (kbd "<leader> t x") #'vterm)
;; stop using vim keys
(evil-set-initial-state 'vterm-mode 'emacs)

(defun id/vterm-mode-hook ()
  (setq-local evil-escape-inhibit t))
(add-hook 'vterm-mode-hook #'id/vterm-mode-hook)

;; tmux-pane.
(straight-use-package 'tmux-pane)
(tmux-pane-mode +1)
;; disable some unused keys to avoid collison.
(define-key tmux-pane--override-keymap (kbd "C-k") nil)
(define-key tmux-pane--override-keymap (kbd "C-h") nil)
(define-key tmux-pane--override-keymap (kbd "C-\\") nil)
