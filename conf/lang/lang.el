;;; ~/.emacs.d/lang/lang.el -*- lexical-binding: t; -*-

;;; Enable line highlighting.
(add-hook 'prog-mode-hook #'hl-line-mode)

;;; Rainbow delimiters.
(straight-use-package 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
