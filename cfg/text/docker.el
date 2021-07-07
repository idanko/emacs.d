;;; ~/.emacs.d/cfg/text/docker.el -*- lexical-binding: t; -*-

(straight-use-package 'dockerfile-mode)

(add-hook 'dockerfile-mode-hook #'display-line-numbers-mode)
