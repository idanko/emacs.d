;;; ~/.emacs.d/cfg/buffer.el -*- lexical-binding: t; -*-

;;; Key bindings.
(evil-global-set-key 'normal (kbd "<leader> b i") #'revert-buffer) ; (invigorate).
(evil-global-set-key 'normal (kbd "<leader> b r") #'counsel-recentf)
(evil-global-set-key 'normal "X" #'kill-this-buffer)

(with-eval-after-load 'ivy
  (evil-global-set-key 'normal (kbd "<leader> <") #'ivy-switch-buffer))
