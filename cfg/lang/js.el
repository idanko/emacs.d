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
    (eglot-ensure))
  (define-key js-mode-map [(meta ?.)] #'xref-find-definitions))

(add-hook 'js-mode-hook #'id/js-mode-hook)

;; js sandbox file.
(defun id/open-sandbox-js ()
  "Visit todo file."
  (interactive)
  (find-file "~/github.com/idanko/sandbox-js/app.js"))
(global-set-key (kbd "C-c b j") #'id/open-sandbox-js)


;;; Typescript.
(use-package typescript-mode)
