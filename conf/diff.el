;;; ~/.emacs.d/conf/diff.el -*- lexical-binding: t; -*-

;;; Common.

;; Always split horizontally.
(setq ediff-split-window-function #'split-window-horizontally)

;; Disable ediff control frame.
(setq ediff-window-setup-function #'ediff-setup-windows-plain)
