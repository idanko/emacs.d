;;; ~/.emacs.d/conf/text/web.el -*- lexical-binding: t; -*-

;;; Web Mode.
(straight-use-package 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;; Settings.
(setq id/web-indent-level 2)
(setq-default web-mode-code-indent-offset id/web-indent-level)
(setq-default web-mode-markup-indent-offset id/web-indent-level)
(setq-default web-mode-css-indent-offset id/web-indent-level)

;; Disable truncate lines.
(defun id/web-mode-hook ()
  (toggle-truncate-lines +1))
(add-hook 'web-mode-hook #'id/web-mode-hook)
