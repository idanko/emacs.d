;;; ~/.emacs.d/conf/spell.el -*- lexical-binding: t; -*-

;;; Flyspell.
(defun id/flyspell-toggle ()
  "Toggle highlight of spell checking."
  (interactive)
  (if flyspell-mode
      (progn
        (message "Flyspell mode off")
        (flyspell-mode -1))
    (progn
      (message "Flyspell mode on")
      (if (derived-mode-p 'prog-mode)
          (flyspell-prog-mode)
        (flyspell-mode +1))
      (flyspell-buffer))))

(global-set-key (kbd "C-c t s") #'id/flyspell-toggle)

;;; Use common interface for spell correction.
(straight-use-package 'flyspell-correct)
(with-eval-after-load 'flyspell
  (define-key flyspell-mode-map [remap flyspell-correct-word-before-point] #'flyspell-correct-wrapper)
  (define-key flyspell-mode-map [remap flyspell-auto-correct-word] #'ispell-region))
