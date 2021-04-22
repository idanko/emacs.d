;;; ~/.emacs.d/cfg/lang/lisp.el -*- lexical-binding: t; -*-

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
  ;; TODO(idanko): fix mapping
  (evil-global-set-key 'normal (kbd "<localleader> r") #'clj-refactor-map))

;;; Elisp.
(defun id/emacs-lisp-mode-hook ()
  (id/shared-lisp-mode-hook)
  (evil-global-set-key 'normal (kbd "<localleader> e e") #'eval-defun))
(add-hook 'emacs-lisp-mode-hook #'id/emacs-lisp-mode-hook)
