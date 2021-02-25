;;; ~/.emacs.d/conf/lang/lisp.el -*- lexical-binding: t; -*-

;;; Settings.
;;; Editing.
(straight-use-package 'paredit)

(defun id/shared-lisp-mode-hook ()
  (paredit-mode +1)
  (setq-local fill-column 80))

;;; Clojure.
(straight-use-package 'cider)
(straight-use-package 'clj-refactor)

(defun id/clojure-mode-hook ()
  (id/shared-lisp-mode-hook)
  (clj-refactor-mode +1))
(add-hook 'clojure-mode-hook #'id/clojure-mode-hook)

(with-eval-after-load 'clj-refactor
  (cljr-add-keybindings-with-prefix "C-c RET"))

;;; Elisp.
(defun id/emacs-lisp-mode-hook ()
  (id/shared-lisp-mode-hook))
(add-hook 'emacs-lisp-mode-hook #'id/emacs-lisp-mode-hook)
