;;; ~/.emacs.d/conf/completion.el -*- lexical-binding: t; -*-

;;; LSP.
(straight-use-package 'lsp-mode)
(setq lsp-diagnostic-package :none)
(setq lsp-diagnostics-modeline-scope nil) ;; Disable mode-line integration.
(setq lsp-restart 'ignore) ; Suppress restart process confirmation.
(setq lsp-enable-links nil)
(setq lsp-enable-symbol-highlighting nil)
(setq lsp-headerline-breadcrumb-enable nil) ; Disable LSP headerline.

;;; Company.
(straight-use-package 'company)
(setq company-tooltip-limit 10
      ;; Make completion a bit faster.
      company-idle-delay 0.5
      company-minimum-prefix-length 2)
(global-company-mode +1)
(with-eval-after-load 'company
  (add-to-list 'company-backends 'company-capf)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))
