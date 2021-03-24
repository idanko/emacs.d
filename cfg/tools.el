;;; ~/.emacs.d/cfg/tools.el -*- lexical-binding: t; -*-

;;; Xclip.
;; Yank to clipboard in the terminal.
(straight-use-package 'xclip)
(xclip-mode +1)

;;; Snippets.
(straight-use-package 'yasnippet)
(yas-global-mode +1)

(defun id/yasnippet-mode-hook ()
  "Activate fundamental-hook folder snippets allowing use them in
all modes."
  (yas-activate-extra-mode 'fundamental-mode))
(add-hook 'yas-minor-mode-hook #'id/yasnippet-mode-hook)

;;; Flycheck.
(straight-use-package 'flycheck)
