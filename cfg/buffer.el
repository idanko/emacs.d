;;; ~/.emacs.d/cfg/buffer.el -*- lexical-binding: t; -*-

;;; Key bindings.
(evil-global-set-key 'normal (kbd "<leader> b i") #'revert-buffer) ; (invigorate).
(evil-global-set-key 'normal (kbd "<leader> b r") #'counsel-recentf)
(evil-global-set-key 'normal "X" #'kill-this-buffer)

;; XXX the idea is: if it's only one window duplicate it and switch, otherwise
;; run delete-other-windows.
(defun id/toggle-only-window ()
  (interactive)
  (delete-other-windows))
(evil-global-set-key 'normal (kbd "C-/") #'id/toggle-only-window)

(with-eval-after-load 'ivy
  (evil-global-set-key 'normal (kbd "<leader> <") #'ivy-switch-buffer))
