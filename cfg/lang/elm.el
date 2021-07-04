;;; ~/.emacs.d/cfg/lang/elm.el -*- lexical-binding: t; -*-

;;; ELM mode.
(straight-use-package 'elm-mode)

(defun id/elm-mode-hook ()
  (setq-local elm-indent-offset 2)
  (elm-indent-simple-mode +1)
  (eglot-ensure))
(add-hook 'elm-mode-hook #'id/elm-mode-hook)
