;;; ~/.emacs.d/lang/lang.el -*- lexical-binding: t; -*-

;;; Rainbow delimiters.
(straight-use-package 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;;; Line number mode.
(add-hook 'prog-mode-hook #'display-line-numbers-mode)
