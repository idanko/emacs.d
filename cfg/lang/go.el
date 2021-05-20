;;; ~/.emacs.d/cfg/lang/go.el -*- lexical-binding: t; -*-

;;; Go Mode.
(straight-use-package 'go-mode)
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))

;; fix jump stack error
;; NOTE: vim's go-to-definition binding comes from `evil-collection'
(defun id/go-to-definition-golang (orig-fun &rest args)
  (evil--jumps-push)
  (let ((res (apply orig-fun args)))
    res))
(advice-add 'godef-jump :around #'id/go-to-definition-golang)

(defun id/go-mode-hook ()
  (setq-local gofmt-command "goimports"
              fill-column 80)
  (add-hook 'before-save-hook 'gofmt-before-save)
  (eglot-ensure)
  ;; Sort imports by:
  ;; - stdlib
  ;; - 3rd party modules
  ;; - project modules
  (when-let* ((base-dir (cdr-safe (project-current)))
              (index (string-match "\\(gitlab.com\\|github.com\\|bitbucket.org\\)"
                                   base-dir))
              (pattern (substring base-dir index (length base-dir))))
    (setq-local gofmt-args (list "-local" (string-remove-suffix "/" pattern)))))

(add-hook 'go-mode-hook #'id/go-mode-hook)
