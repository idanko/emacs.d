;;; ~/.emacs.d/cfg/search.el -*- lexical-binding: t; -*-

;;; Isearch.
;; Better search highlighting.
(defun id/isearch-region (&rest _)
  "If a region is active, make this the isearch default search
pattern."
  (interactive "P\np")
  (when (use-region-p)
    (let ((search (buffer-substring-no-properties
                   (region-beginning)
                   (region-end))))
      (setq deactivate-mark t)
      (isearch-yank-string search))))

(advice-add 'isearch-forward-regexp :after #'id/isearch-region)
(advice-add 'isearch-forward :after #'id/isearch-region)

;;; Anzu.
(straight-use-package 'anzu)
(global-anzu-mode +1)
(evil-global-set-key 'normal (kbd "<leader> s r") #'anzu-query-replace)
(evil-global-set-key 'normal (kbd "<leader> s x") #'anzu-query-replace-regexp)

;;; RG.
;; See how to use: https://www.youtube.com/watch?v=OcR-Ke2CiPo
(straight-use-package 'rg)
(evil-global-set-key 'normal (kbd "<leader> s g") #'rg)
(evil-global-set-key 'normal (kbd "<leader> s !") #'wgrep-save-all-buffers)

;; Counsel interop.
(defun id/selection-or-interactive ()
  "Return selected region if any or a read an inserted text."
  (let ((content (if mark-active
                     (buffer-substring-no-properties (mark) (point))
                   (read-from-minibuffer "Search: "))))
    (if mark-active (deactivate-mark))
    content))

(defun id/counsel-project-rg ()
  "Execute counsel-ag command against the project root directory."
  (interactive)
  (counsel-rg (id/selection-or-interactive) (cdr-safe (project-current))))

(defun id/counsel-rg ()
  "Execute counsel-ag command against the buffer's directory."
  (interactive)
  (counsel-rg (id/selection-or-interactive) (file-name-directory buffer-file-name)))

(evil-define-key '(normal visual) 'global-map (kbd "<leader> s s") #'id/counsel-project-rg)
(evil-define-key '(normal visual) 'global-map (kbd "<leader> s c") #'id/counsel-rg)

(with-eval-after-load 'ivy
  (evil-global-set-key 'normal (kbd "<leader> >") #'ivy-resume))
