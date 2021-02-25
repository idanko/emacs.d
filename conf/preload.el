;;; ~/.emacs.d/conf/preload.el -*- lexical-binding: t; -*-

;; Optimize boot time by increasing GC during load.
(setq gc-cons-threshold 402653184
      gc-cons-percentage 0.6)

;; Minor boot optimization.
(setq package-enable-at-startup nil     ; don't auto-initialize!
      ;; this tells package.el not to add those pesky customized variable settings
      ;; at the end of your init.el
      package--init-file-ensured t)

;; Always load newest byte code.
(setq load-prefer-newer t)

;; Make bytecompilation and loading be happy.
(setq font-lock-verbose nil
      byte-compile-verbose nil)
