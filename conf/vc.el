;;; ~/.emacs.d/conf/vc.el -*- lexical-binding: t; -*-

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

(global-set-key (kbd "C-c g g") #'magit-status)
(global-set-key (kbd "C-c g b") #'magit-blame)
(global-set-key (kbd "C-c g l") #'magit-log-buffer-file)

;;; Git Link.
(straight-use-package 'git-link)
;; Copy path to the clipboard.
(global-set-key (kbd "C-c g u") #'git-link)
