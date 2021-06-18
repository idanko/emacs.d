;;; ~/.emacs.d/cfg/terminal.el -*- lexical-binding: t; -*-

;;; Xclip.
;; Yank to clipboard in the terminal.
(straight-use-package 'xclip)
(unless (display-graphic-p)
  (xclip-mode +1))

