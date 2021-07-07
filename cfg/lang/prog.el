;;; ~/.emacs.d/lang/prog.el -*- lexical-binding: t; -*-

;;; Rainbow delimiters.
(straight-use-package 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;;; Auto formatting.
(defun id/auto-format ()
  (interactive)
  (when (and (derived-mode-p 'prog-mode)
             (pcase major-mode
               ('elm-mode nil)
               ('python-mode nil)
               (_ t)))
    (save-excursion
      (mark-paragraph)
      (call-interactively 'indent-region))))

(add-hook 'before-save-hook #'id/auto-format)

;;; Line number mode.
(add-hook 'prog-mode-hook #'display-line-numbers-mode)
