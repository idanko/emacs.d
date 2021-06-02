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
(use-package anzu
  :config
  (global-anzu-mode +1)
  (global-set-key [remap query-replace] #'anzu-query-replace)
  (global-set-key [remap query-replace-regexp] #'anzu-query-replace-regexp))

;;; RG.
;; See how to use: https://www.youtube.com/watch?v=OcR-Ke2CiPo
(use-package rg
  :config
  (global-set-key (kbd "C-c s r") #'rg)
  (global-set-key (kbd "C-c s !") #'wgrep-save-all-buffers)
  (global-set-key (kbd "C-c s s") #'id/counsel-project-rg)
  (global-set-key (kbd "C-c s c") #'id/counsel-rg))

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
