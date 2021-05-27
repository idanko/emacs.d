;;; ~/.emacs.d/cfg/checkers.el -*- lexical-binding: t; -*-

;;; Flycheck.
(straight-use-package 'flycheck)

(setq flycheck-indication-mode nil
      flycheck-highlighting-mode nil)

(defun id/flycheck-mode-hook-global ()
  (evil-global-set-key 'normal (kbd "<localleader> c l") #'flycheck-list-errors))
(add-hook 'flycheck-mode-hook #'id/flycheck-mode-hook-global)
