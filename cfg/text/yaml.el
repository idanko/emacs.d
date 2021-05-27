;;; ~/.emacs.d/cfg/text/yaml.el -*- lexical-binding: t; -*-

;;; Settings.
;;; Line number mode.
(add-hook 'yaml-mode-hook #'display-line-numbers-mode)

;;; Yaml Mode.
(straight-use-package 'yaml-mode)

;;; Flycheck integration.
;; Enable `yamllint' checker.
;; To install yamllint:
;; OSX: brew install yamllint
;; Debian based: sudo apt install yamllint
(add-hook 'yaml-mode-hook #'flycheck-mode)
