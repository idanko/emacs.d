;;; ~/.emacs.d/conf/editor.el -*- lexical-binding: t; -*-

;;; Expand region.
(straight-use-package 'expand-region)
(global-set-key [remap open-line] #'er/expand-region) ;; remapped to C-o

;;; Multiple Cursors.
(straight-use-package 'multiple-cursors)

(defhydra id/cursors-hydra-keymap (:color blue)
  "Multiple Cursors"
  (">" mc/mark-next-like-this "mark next" :exit nil)
  ("n" mc/skip-to-next-like-this "skip to next" :exit nil)
  ("<" mc/unmark-next-like-this "unmark" :exit nil)
  ("e" mc/edit-lines "edit selection" :exit t)
  ("a" mc/mark-all-like-this "mark all" :exit t)
  ("q" nil "cancel"))

(global-set-key (kbd "C-c m") #'id/cursors-hydra-keymap/body)

;;; Electtric Pair Mode.
(electric-pair-mode +1)

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
