;;; ~/.emacs.d/cfg/lang/lisp.el -*- lexical-binding: t; -*-

;;; Clojure.
(use-package cider)
(use-package clj-refactor
  :after (cider)
  :init
  (add-hook 'clojure-mode-hook #'clj-refactor-mode))

(defun id/clojure-mode-hook ()
  (id/shared-lisp-mode-hook))
(add-hook 'clojure-mode-hook #'id/clojure-mode-hook)

;;; Editing.
(use-package paredit
  :init
  (add-hook 'emacs-lisp-mode-hook #'paredit-mode)
  (add-hook 'clojure-mode-hook #'paredit-mode))

(defun id/shared-lisp-mode-hook ()
  (setq-local fill-column 80))

;;; Elisp.
(defun id/emacs-lisp-mode-hook ()
  (id/shared-lisp-mode-hook))
(add-hook 'emacs-lisp-mode-hook #'id/emacs-lisp-mode-hook)
