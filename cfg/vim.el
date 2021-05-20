;;; ~/.emacs.d/cfg/vim.el -*- lexical-binding: t; -*-

;;; Vim keybinding
(setq evil-want-keybinding nil) ;; required by evil-collection
(straight-use-package 'evil)
(evil-mode +1)

;; fix an issue with underscore.
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
