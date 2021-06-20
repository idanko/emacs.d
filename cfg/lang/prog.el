;;; ~/.emacs.d/lang/prog.el -*- lexical-binding: t; -*-

;;; Rainbow delimiters.
(straight-use-package 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;;; Auto formatting.
(defun id/auto-format ()
  (interactive)
  (when (cond
         ((derived-mode-p 'prog-mode) t)
         (t nil))
    (save-excursion
      (mark-paragraph)
      (call-interactively 'indent-region))))

(add-hook 'before-save-hook #'id/auto-format)

