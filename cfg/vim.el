;;; ~/.emacs.d/cfg/vim.el -*- lexical-binding: t; -*-

;;; VIM core.
(setq evil-want-keybinding nil) ;; required by evil-collection
(straight-use-package 'evil)
(evil-mode +1)

(straight-use-package 'undo-tree)
(evil-set-undo-system 'undo-tree)
(global-undo-tree-mode +1)
;; fix `Undo-tree mode not enabled in buffer` error message
;; (https://github.com/syl20bnr/spacemacs/issues/14064#:~:text=global%2Dundo%2Dtree%2Dmode%20will%20not%20enable%20undo%2D,place%2C%20and%20not%20overriding%20them)
(with-eval-after-load 'undo-tree (defun undo-tree-overridden-undo-bindings-p () nil))

;; Fix an issue with underscore.
;; https://emacs.stackexchange.com/questions/9583/how-to-treat-underscore-as-part-of-the-word#answer-20717
(with-eval-after-load 'evil
  (defalias #'forward-evil-word #'forward-evil-symbol)
  ;; make evil-search-word look for symbol rather than word boundaries
  (setq-default evil-symbol-word-search t))

;; fix leader key issue of view-mode.
(add-hook 'view-mode-hook
          (evil-define-key 'normal view-mode-map (kbd "<SPC>") nil))

(evil-set-leader '(normal visual) (kbd "SPC"))
(evil-set-leader '(normal visual) (kbd ",") 'localleader)

;; Simulate nnoremap * g*``.
(defun id/evil-search-word-forward (orig-fun &rest args)
  (apply orig-fun args)
  (let ((res (evil-search-previous)))
    res))
(advice-add 'evil-search-word-forward :around #'id/evil-search-word-forward)

;; Custom escape sequence.
(straight-use-package 'evil-escape)
(evil-escape-mode +1)
(setq-default evil-escape-delay 0.3)

;;; Goodies.
;; collection.
(straight-use-package 'evil-collection)
(require 'evil-collection)
(setq evil-collection-mode-list (remove 'go-mode evil-collection-mode-list))
(setq evil-collection-mode-list (remove 'vterm evil-collection-mode-list))
(setq evil-collection-mode-list (remove 'eglot evil-collection-mode-list))
(evil-collection-init)

;; vim-surround.
(straight-use-package 'evil-surround)
(global-evil-surround-mode +1)

;; vim-commentary.
(straight-use-package 'evil-commentary)
(evil-commentary-mode +1)

;; evil-terminal-cursor-changer.
(unless (display-graphic-p)
  (straight-use-package 'evil-terminal-cursor-changer)
  (evil-terminal-cursor-changer-activate))
