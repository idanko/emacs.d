;;; ~/.emacs.d/cfg/completion.el -*- lexical-binding: t; -*-

;;; Snippets.
(use-package yasnippet
  :config
  (yas-global-mode +1)
  (add-hook 'yas-minor-mode-hook #'id/yasnippet-mode-hook))

(defun id/yasnippet-mode-hook ()
  "Activate fundamental-hook folder snippets allowing use them in
all modes."
  (yas-activate-extra-mode 'fundamental-mode))

;;; Company.
(use-package company
  :after (yasnippet)
  :config
  (setq company-tooltip-limit 10
      ;; Make completion a bit faster.
      company-idle-delay 0.5
      company-minimum-prefix-length 2)
  (global-company-mode +1)
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

(use-package company-posframe
  :config
  (company-posframe-mode +1))

;;; Emmet mode.
(use-package emmet-mode)

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

(global-set-key [remap indent-for-tab-command] #'id/complete-tab)
