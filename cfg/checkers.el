;;; ~/.emacs.d/cfg/checkers.el -*- lexical-binding: t; -*-

;;; Flycheck.
(use-package flycheck
  :bind (("C-c t s" . id/flyspell-toggle))
  :config
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
        (flyspell-buffer)))))

;;; Use common interface for spell correction.
(use-package flyspell-correct
  :after (flyspell)
  :config
  (define-key flyspell-mode-map [remap flyspell-correct-word-before-point] #'flyspell-correct-wrapper)
  (define-key flyspell-mode-map [remap flyspell-auto-correct-word] #'ispell-region))
