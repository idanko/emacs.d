;;; ~/.emacs.d/cfg/vim.el -*- lexical-binding: t; -*-

;;; Vim keybinding
(setq evil-want-keybinding nil) ;; required by evil-collection
(straight-use-package 'evil)
(evil-mode +1)

(evil-set-leader '(normal visual) (kbd "SPC"))
(evil-set-leader '(normal visual) (kbd ",") 'localleader)

;;; Custom escape sequence.
(straight-use-package 'evil-escape)
(evil-escape-mode +1)
(setq-default evil-escape-delay 0.3)

;;; Goodies.
;; Collection.
(straight-use-package 'evil-collection)
(evil-collection-init)

;; vim-surround.
(straight-use-package 'evil-surround)
(global-evil-surround-mode +1)

;; evil-terminal-cursor-changer.
(unless (display-graphic-p)
  (straight-use-package 'evil-terminal-cursor-changer)
  (evil-terminal-cursor-changer-activate))

;; tmux-pane.
(unless (display-graphic-p)
  (straight-use-package 'tmux-pane)
  (tmux-pane-mode +1))
