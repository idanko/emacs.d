;;; ~/.emacs.d/cfg/lang/js.el -*- lexical-binding: t; -*-

;;; Settings.
(setq js-indent-level 2)

(with-eval-after-load 'js
  (define-key js-mode-map (kbd "M-.") #'xref-find-definitions))

(defun id/js-mode-hook ()
  ;; Don't allow JSON files to be hooked with LSP.
  (when (pcase (file-name-extension buffer-file-name)
          ("ts" t)
          ("js" t)
          (_ nil))
    ;; Make sure that lsp is installed:
    ;; sudo npm install -g typescript-language-server.
    (lsp-deferred)))

(add-hook 'js-mode-hook #'id/js-mode-hook)
