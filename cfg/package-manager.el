;;; ~/.emacs.d/cfg/package-manager.el -*- lexical-binding: t; -*-

;; use-package.
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(require 'use-package)
(setq use-package-always-ensure t)
