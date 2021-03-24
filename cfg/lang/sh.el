;;; ~/.emacs.d/cfg/lang/sh.el -*- lexical-binding: t; -*-

;;; Flycheck integration.
;; Make sure that `shellcheck' is installed.
(add-hook 'sh-mode-hook #'flycheck-mode)
