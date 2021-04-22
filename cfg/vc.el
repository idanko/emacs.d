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

(evil-global-set-key 'normal (kbd "<leader> g g") #'magit-status)
(evil-global-set-key 'normal (kbd "<leader> g b") #'magit-blame)
(evil-global-set-key 'normal (kbd "<leader> g l") #'magit-log-buffer-file)

;;; Git Link.
(straight-use-package 'git-link)
;; Copy path to the clipboard.
(evil-global-set-key 'normal (kbd "<leader> g u") #'git-link)
