;;; ~/.emacs.d/cfg/vim.el -*- lexical-binding: t; -*-

;;; Vim keybinding
(setq evil-want-keybinding nil) ;; required by evil-collection
(straight-use-package 'evil)
(evil-mode +1)

(evil-set-leader '(normal visual) (kbd "SPC"))
(evil-set-leader '(normal visual) (kbd ",") 'localleader)
(evil-global-set-key 'normal (kbd "C-l") #'evil-window-right)
(evil-global-set-key 'normal (kbd "C-h") #'evil-window-left)
(evil-global-set-key 'normal (kbd "C-j") #'evil-window-up)
(evil-global-set-key 'normal (kbd "C-k") #'evil-window-down)

;;; Custom escape sequence.
(straight-use-package 'evil-escape)
(evil-escape-mode +1)
(setq-default evil-escape-delay 0.3)

;;; Goodies.
;; Collection.
(straight-use-package 'evil-collection)
(evil-collection-init)

;; Vim-surround.
(straight-use-package 'evil-surround)
(global-evil-surround-mode +1)
