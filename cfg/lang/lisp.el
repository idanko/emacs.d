;;; ~/.emacs.d/cfg/lang/lisp.el -*- lexical-binding: t; -*-

;;; Settings.
;;; Editing.
(straight-use-package 'evil-paredit)

(defun id/shared-lisp-mode-hook ()
  (evil-paredit-mode +1)
  (setq-local fill-column 80))

;;; Clojure.
(straight-use-package 'cider)
(straight-use-package 'clj-refactor)

(defun id/clojure-mode-hook ()
  (id/shared-lisp-mode-hook)
  (clj-refactor-mode +1)
  (evil-define-key 'normal 'clojure-mode-map (kbd "<localleader> e r") #'cider-eval-defun-at-point)
  (evil-define-key 'normal 'clojure-mode-map (kbd "<localleader> e e") #'cider-eval-last-sexp)
  (evil-define-key 'normal 'clojure-mode-map (kbd "<localleader> e b") #'cider-eval-buffer)
  (evil-define-key 'normal 'clojure-mode-map (kbd "<localleader> c c") #'cider-jack-in)
  (evil-define-key 'normal 'clojure-mode-map (kbd "<localleader> c i") #'cider-inspect-last-result)
  (evil-define-key 'normal 'clojure-mode-map (kbd "<localleader> c r") #'cider-interrupt)
  (evil-define-key 'normal 'clojure-mode-map (kbd "<localleader> c n") #'cider-repl-set-ns))
(add-hook 'clojure-mode-hook #'id/clojure-mode-hook)

;; fix jump stack error
;; NOTE: vim's go-to-definition binding comes from `evil-collection'
(defun id/clj-to-definition-golang (orig-fun &rest args)
  (evil--jumps-push)
  (let ((res (apply orig-fun args)))
    res))
(advice-add 'cider-find-var :around #'id/clj-to-definition-golang)

(with-eval-after-load 'clj-refactor
  ;; TODO(idanko): fix mapping
  ;; (evil-global-set-key 'normal (kbd "<localleader> r") #'clj-refactor-map)
  )

;;; Elisp.
(defun id/emacs-lisp-mode-hook ()
  (id/shared-lisp-mode-hook)
  (paredit-mode +1)
  (evil-define-key 'normal 'emacs-lisp-mode-map (kbd "<localleader> e r") #'eval-defun)
  (evil-define-key 'normal 'emacs-lisp-mode-map (kbd "<localleader> e e") #'eval-last-sexp)
  (evil-define-key 'normal 'emacs-lisp-mode-map (kbd "<localleader> e b") #'eval-buffer))
(add-hook 'emacs-lisp-mode-hook #'id/emacs-lisp-mode-hook)

;;; Racket.
(straight-use-package 'racket-mode)
(defun id/racket-mode-hook ()
  (id/shared-lisp-mode-hook)
  (paredit-mode +1))
(add-hook 'racket-mode-hook #'id/racket-mode-hook)
