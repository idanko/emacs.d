;;; ~/.emacs.d/postload.el -*- lexical-binding: t; -*-

;; https://github.com/hlissner/doom-emacs/issues/310
;; After startup, it is important you reset this to some reasonable
;; default. A large gc-cons-threshold will cause freezing and
;; stuttering during long-term interactive use (See the beginning of
;; this file). I find these are nice defaults:
(defun id/normalize-gc ()
  (setq gc-cons-threshold 16777216
        gc-cons-percentage 0.1))
(add-hook 'emacs-startup-hook #'id/normalize-gc)
