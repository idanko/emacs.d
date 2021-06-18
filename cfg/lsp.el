;;; ~/.emacs.d/cfg/lsp.el -*- lexical-binding: t; -*-

;;; LSP.
;;; lsp (eglot).
(straight-use-package 'eglot)
;; workaround of the error on `eglot' cmd
(defun project-root (project)
  (car (project-roots project)))
;; dont use flymake report, use flycheck instead.
(setq eglot-stay-out-of '(flymake))

