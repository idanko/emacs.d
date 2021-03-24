;;; ~/.emacs.d/lang/lang.el -*- lexical-binding: t; -*-

;;; Rainbow delimiters.
(straight-use-package 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
