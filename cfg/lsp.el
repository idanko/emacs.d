;;; ~/.emacs.d/cfg/lsp.el -*- lexical-binding: t; -*-

;;; LSP.
;;; lsp (eglot).
(straight-use-package 'eglot)
;; dont use flymake report, use flycheck instead.
(setq eglot-stay-out-of '(flymake))
