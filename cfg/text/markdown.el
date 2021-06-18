;;; ~/.emacs.d/cfg/text/markdown.el -*- lexical-binding: t; -*-

;;; Markdown Mode.
(straight-use-package 'markdown-mode)
;; Use major mode native style.
(setq markdown-fontify-code-blocks-natively t)
(add-hook 'markdown-mode-hook #'id/markdown-mode-hook)

;;; Settings.
(defun id/markdown-mode-hook ()
  (setq-local fill-column 80)
  ;; Fold on file load.
  (save-excursion
    (goto-char (point-min))
    (while (re-search-forward "^#" nil t)
      (outline-hide-body))))

