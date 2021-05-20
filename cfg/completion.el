;;; ~/.emacs.d/cfg/completion.el -*- lexical-binding: t; -*-

;;; Snippets.
(straight-use-package 'yasnippet)
(yas-global-mode +1)

(defun id/yasnippet-mode-hook ()
  "Activate fundamental-hook folder snippets allowing use them in
all modes."
  (yas-activate-extra-mode 'fundamental-mode))
(add-hook 'yas-minor-mode-hook #'id/yasnippet-mode-hook)

;;; lsp (eglot).
(straight-use-package 'eglot)
;; workaround of the error on `eglot' cmd
(defun project-root (project)
  (car (project-roots project)))

;;; Company.
(straight-use-package 'company)
(setq company-tooltip-limit 10
      ;; Make completion a bit faster.
      company-idle-delay 0.5
      company-minimum-prefix-length 2)
(global-company-mode +1)

(with-eval-after-load 'company
  (defun id/company-backend-with-yas (backends)
    (if (and (listp backends) (memq 'company-yasnippet backends))
	    backends
	  (append (if (consp backends)
		          backends
		        (list backends))
		      '(:with company-yasnippet))))

  ;; add yasnippet to all backends
  (setq company-backends
        (mapcar #'id/company-backend-with-yas company-backends))

  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))


;;; Emmet mode.
(straight-use-package 'emmet-mode)

;;; Complete Tab.
(defun id/complete-tab ()
  (interactive)
  (call-interactively
   (cond ((<= (current-column)(current-indentation))
          #'indent-for-tab-command)
         ((and (bound-and-true-p yas-minor-mode)
               (yas--templates-for-key-at-point))
          #'yas-expand)
         ((and (bound-and-true-p yas-minor-mode)
               (bound-and-true-p emmet-mode))
          #'emmet-expand-yas)
         ((bound-and-true-p emmet-mode)
          #'emmet-expand-line)
         (t #'indent-for-tab-command))))

(evil-define-key 'insert 'global-map (kbd "TAB") #'id/complete-tab)
