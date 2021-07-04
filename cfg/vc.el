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
(defun id/git-commit-setup-hook ()
  (flyspell-mode +1)
  (evil-insert-state))
(add-hook 'git-commit-setup-hook #'id/git-commit-setup-hook)

(evil-global-set-key 'normal (kbd "<leader> g g") #'magit-status)
(evil-global-set-key 'normal (kbd "<leader> g b") #'magit-blame)

;;; Git Link.
(straight-use-package 'git-link)
;; Copy path to the clipboard.
(evil-global-set-key 'normal (kbd "<leader> g u") #'git-link)

;; Git gutter.
(straight-use-package 'git-gutter)
(custom-set-variables
 '(git-gutter:modified-sign "▌")
 '(git-gutter:added-sign "▌")
 '(git-gutter:deleted-sign "▌")
 '(git-gutter:hide-gutter t))

(global-git-gutter-mode +1)
;; update when focused
(add-to-list 'git-gutter:update-commands 'other-window)
(add-to-list 'git-gutter:update-hooks 'focus-in-hook)

;; mapping.
(with-eval-after-load 'git-gutter
  (evil-global-set-key 'normal (kbd "]c") #'git-gutter:next-hunk)
  (evil-global-set-key 'normal (kbd "[c") #'git-gutter:previous-hunk))
