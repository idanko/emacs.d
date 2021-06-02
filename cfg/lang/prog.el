;;; ~/.emacs.d/lang/prog.el -*- lexical-binding: t; -*-

;;; Rainbow delimiters.
(use-package rainbow-delimiters
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))
