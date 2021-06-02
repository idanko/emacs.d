;;; ~/.emacs.d/cfg/lsp.el -*- lexical-binding: t; -*-

;;; LSP.
;;; lsp (eglot).
(use-package eglot
  :init
  ;; workaround of the error on `eglot' cmd
  ;; (defun project-root (project)
  ;;   (car (project-roots project)))
  )
