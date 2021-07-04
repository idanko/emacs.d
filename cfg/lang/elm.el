;;; ~/.emacs.d/cfg/lang/elm.el -*- lexical-binding: t; -*-

;;; ELM mode.
(straight-use-package 'elm-mode)

(setq elm-mode-hook '(elm-indent-simple-mode))
