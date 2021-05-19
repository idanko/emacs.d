;;; ~/.emacs.d/cfg/navigation.el -*- lexical-binding: t; -*-

;; Projectile.
(straight-use-package 'projectile)
(setq projectile-completion-system 'ivy)
(projectile-mode +1)

(define-key projectile-command-map "#" #'projectile-remove-known-project)
(evil-global-set-key 'normal (kbd "<leader> p") #'projectile-command-map)
(evil-global-set-key 'normal (kbd "<localleader> f f") #'projectile-find-file)
