;;; ~/.emacs.d/cfg/edit.el -*- lexical-binding: t; -*-

;;; Expand region.
(straight-use-package 'expand-region)
(evil-global-set-key 'normal (kbd "+") #'er/expand-region)

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

(evil-define-key '(normal visual) 'global-map (kbd "<leader> <SPC>") #'id/cursors-hydra-keymap/body)

;;; Electtric Pair Mode.
(electric-pair-mode +1)

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
