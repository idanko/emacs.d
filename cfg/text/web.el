;;; ~/.emacs.d/cfg/text/web.el -*- lexical-binding: t; -*-

;;; Web Mode.
(setq id/web-indent-level 2)

(use-package web-mode
  :after (emmet)
  :config
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  ;; Disable truncate lines.
  (defun id/web-mode-hook ()
    (toggle-truncate-lines +1)
    (emmet-mode +1))
  (add-hook 'web-mode-hook #'id/web-mode-hook)
  ;; Settings.
  (setq-default web-mode-code-indent-offset id/web-indent-level)
  (setq-default web-mode-markup-indent-offset id/web-indent-level)
  (setq-default web-mode-css-indent-offset id/web-indent-level))

;;; Json mode.
(use-package json-mode
  :after (flycheck)
  :config
  (add-hook 'json-mode-hook #'flycheck-mode))
