;;; ~/.emacs.d/cfg/checkers.el -*- lexical-binding: t; -*-

;;; Flycheck.
(straight-use-package 'flycheck)

(setq flycheck-indication-mode 'left-margin
      flycheck-highlighting-mode nil)

(evil-global-set-key 'normal (kbd "<localleader> t e") #'flycheck-list-errors)

