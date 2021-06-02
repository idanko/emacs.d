;;; ~/.emacs.d/cfg/text/yaml.el -*- lexical-binding: t; -*-

;;; Settings.

;;; Yaml Mode.
(use-package yaml-mode
  :after (flycheck)
  :config
  (add-hook 'yaml-mode-hook #'hl-line-mode)
  ;;; Flycheck integration.
  ;; Enable `yamllint' checker.
  ;; To install yamllint:
  ;; OSX: brew install yamllint
  ;; Debian based: sudo apt install yamllint
  (add-hook 'yaml-mode-hook #'flycheck-mode))

