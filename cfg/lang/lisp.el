;;; ~/.emacs.d/cfg/lang/lisp.el -*- lexical-binding: t; -*-

;;; Settings.
;;; Editing.
(straight-use-package 'paredit)

(defun id/shared-lisp-mode-hook ()
  (setq-local fill-column 80))

;;; Clojure.
(straight-use-package 'cider)
(straight-use-package 'clj-refactor)

(defun id/clojure-mode-hook ()
  (id/shared-lisp-mode-hook)
  (clj-refactor-mode +1)
  (evil-global-set-key 'normal (kbd "<localleader> e r") #'cider-eval-defun-at-point)
  (evil-global-set-key 'normal (kbd "<localleader> e s") #'cider-eval-last-sexp)
  (evil-global-set-key 'normal (kbd "<localleader> e b") #'cider-eval-buffer)
  (evil-global-set-key 'normal (kbd "<localleader> c c") #'cider-jack-in)
  (evil-global-set-key 'normal (kbd "<localleader> c i") #'cider-inspect-last-result)
  (evil-global-set-key 'normal (kbd "<localleader> c r") #'cider-interrupt)
  (evil-global-set-key 'normal (kbd "<localleader> c n") #'cider-repl-set-ns))
(add-hook 'clojure-mode-hook #'id/clojure-mode-hook)

(with-eval-after-load 'clj-refactor
  ;; TODO(idanko): fix mapping
  ;; (evil-global-set-key 'normal (kbd "<localleader> r") #'clj-refactor-map)
  )

;;; Elisp.
(defun id/emacs-lisp-mode-hook ()
  (id/shared-lisp-mode-hook)
  (paredit-mode +1)
  (evil-global-set-key 'normal (kbd "<localleader> e r") #'eval-defun)
  (evil-global-set-key 'normal (kbd "<localleader> e e") #'eval-last-sexp)
  (evil-global-set-key 'normal (kbd "<localleader> e b") #'eval-buffer))
(add-hook 'emacs-lisp-mode-hook #'id/emacs-lisp-mode-hook)
