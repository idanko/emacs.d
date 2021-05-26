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

;;; Git Link.
(straight-use-package 'git-link)
;; Copy path to the clipboard.
(evil-global-set-key 'normal (kbd "<localleader> g u") #'git-link)

;; Git gutter.
(straight-use-package 'git-gutter)
(custom-set-variables
 '(git-gutter:hide-gutter nil) ;; TODO(idanko) consider to shows gutter always.
 '(git-gutter:modified-sign "▌")
 '(git-gutter:added-sign "▌")
 '(git-gutter:unchanged-sign " ")
 '(git-gutter:deleted-sign "▌"))

(global-git-gutter-mode +1)
;; update when focused
(add-to-list 'git-gutter:update-commands 'other-window)

;; solarized colors.
(defun id/git-gutter-fix-colors ()
  (set-face-foreground 'git-gutter:modified "#b58900")
  (set-face-background 'git-gutter:unchanged "#f0e9d7"))
(add-hook 'after-load-theme-hook #'id/git-gutter-fix-colors)

;; mapping.
(with-eval-after-load 'git-gutter
  (evil-global-set-key 'normal (kbd "]c") #'git-gutter:next-hunk)
  (evil-global-set-key 'normal (kbd "[c") #'git-gutter:previous-hunk))
