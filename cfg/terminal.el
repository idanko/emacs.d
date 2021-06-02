;;; ~/.emacs.d/cfg/terminal.el -*- lexical-binding: t; -*-

;;; Xclip.
;; Yank to clipboard in the terminal.
(use-package xclip
  :if (not (display-graphic-p))
  :config
  (xclip-mode +1))
