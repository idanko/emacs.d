;;; ~/.emacs.d/cfg/lang/c.el -*- lexical-binding: t; -*-

;;; Settings.
(setq-default c-basic-offset 4)

(defun id/c-mode-hook ()
  ;; Align huge argument list nicely.
  (c-set-offset 'arglist-intro '+)
  ;; No offset inside extern C.
  (c-set-offset 'inextern-lang 0))

(add-hook 'c-mode-hook #'id/c-mode-hook)

;;; Cmake Mode.
(use-package cmake-mode)
