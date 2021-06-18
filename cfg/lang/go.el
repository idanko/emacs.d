;;; ~/.emacs.d/cfg/lang/go.el -*- lexical-binding: t; -*-

;;; Go Mode.
(straight-use-package 'go-mode)
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))

(defun id/go-mode-hook ()
  (setq-local gofmt-command "goimports"
              fill-column 80)
  (add-hook 'before-save-hook 'gofmt-before-save)
  ;;(lsp-deferred)
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

;; go sandbox file.
(defun id/open-sandbox-go ()
  "Visit todo file."
  (interactive)
  (find-file "~/github.com/idanko/sandbox-go/main.go"))
(global-set-key (kbd "C-c b g") #'id/open-sandbox-go)

