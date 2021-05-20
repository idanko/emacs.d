;;; ~/.emacs.d/cfg/lang/js.el -*- lexical-binding: t; -*-

;;; Settings.
(setq js-indent-level 2)

(defun id/js-mode-hook ()
  ;; Don't allow JSON files to be hooked with LSP.
  (when (pcase (file-name-extension buffer-file-name)
          ("ts" t)
          ("js" t)
          (_ nil))
    ;; Make sure that lsp is installed:
    ;; sudo npm install -g typescript-language-server
    (eglot-ensure)))

(add-hook 'js-mode-hook #'id/js-mode-hook)

;;; Typescript.
(straight-use-package 'typescript-mode)
