;;; ~/.emacs.d/cfg/terminal.el -*- lexical-binding: t; -*-

;;; Xclip.
;; Yank to clipboard in the terminal.
(straight-use-package 'xclip)
(xclip-mode +1)

;;; VTerm.
(straight-use-package 'vterm)
(evil-global-set-key 'normal (kbd "<leader> t v") #'vterm)
