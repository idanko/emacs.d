;;; ~/.emacs.d/cfg/buffer.el -*- lexical-binding: t; -*-

;;; Key bindings.
(evil-global-set-key 'normal (kbd "<localleader> b i") #'revert-buffer) ; (invigorate).
(evil-global-set-key 'normal (kbd "<localleader> b r") #'counsel-recentf)
(evil-global-set-key 'normal (kbd "<localleader> b k") #'kill-this-buffer)
(evil-global-set-key 'normal "X" #'kill-this-buffer)

(with-eval-after-load 'ivy
  (evil-global-set-key 'normal (kbd "<leader> <") #'ivy-switch-buffer))
