;;; ~/.emacs.d/cfg/vc.el -*- lexical-binding: t; -*-

;;; Common.
;; Always be up-to-date.
(setq auto-revert-check-vc-info t)
;; Always follow symlinks.
(setq vc-follow-symlinks t)

;;; Magit.
(straight-use-package 'magit)
;; Show in full screen mode.
(setq magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1)
;; Auto check spelling.
(add-hook 'git-commit-setup-hook #'flyspell-mode)

(evil-global-set-key 'normal (kbd "<localleader> g g") #'magit-status)
(evil-global-set-key 'normal (kbd "<localleader> g b") #'magit-blame)
(evil-global-set-key 'normal (kbd "<localleader> g l") #'magit-log-buffer-file)

;;; Git Link.
(straight-use-package 'git-link)
;; Copy path to the clipboard.
(evil-global-set-key 'normal (kbd "<localleader> g u") #'git-link)

;; Git gutter.
(straight-use-package 'git-gutter)
(custom-set-variables
 '(git-gutter:window-width 2)
 '(git-gutter:modified-sign "▌")
 '(git-gutter:added-sign "▌")
 '(git-gutter:deleted-sign "▌"))
(global-git-gutter-mode +1)
