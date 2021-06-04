;;; ~/.emacs.d/cfg/core.el -*- lexical-binding: t; -*-

;;; Common Packages.
;; Hydra.
(use-package hydra)

;; Which Key.
(use-package which-key
  :config
  (which-key-mode +1))

;; Smex.
;; Sort and show the most recent commands at the top of counsel.
(use-package smex)

;; Counsel.
(use-package counsel
  :config
  (global-set-key (kbd "M-x") #'counsel-M-x)
  (global-set-key [remap yank-pop] #'counsel-yank-pop) ;; Binds to M-y.
  (global-set-key [remap describe-variable] #'counsel-describe-variable)
  (global-set-key [remap describe-function] #'counsel-describe-function)
  (global-set-key [remap find-file] #'counsel-find-file))

;; Ivy.
(use-package ivy
  :init
  (setq ivy-use-virtual-buffers t
        enable-recursive-minibuffers t
        ivy-height 15
        ivy-initial-inputs-alist nil)
  :config
  (ivy-mode +1)
  (global-set-key (kbd "C-c r") #'ivy-resume))

(use-package ivy-posframe
  :after (ivy)
  :config
  (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-center)))
  (ivy-posframe-mode +1))

;; Ivy Rich.
;; Show brief description on ivy menu.
(use-package ivy-rich
  :config
  (ivy-rich-mode +1))

;; Projectile.
(use-package projectile
  :after (ivy)
  :init
  (setq projectile-completion-system 'ivy)
  :config
  (define-key projectile-command-map "#" #'projectile-remove-known-project)
  (global-set-key (kbd "C-c p") #'projectile-command-map)
  (projectile-mode +1))

;;; Settings.
(defvar id/cloud-directory "~/Dropbox/emacs"
  "ORG files system location.")
(defvar id/org-directory (concat id/cloud-directory "/org")
  "Personal org files location.")

;; Bookmarks.
(setq bookmark-default-file (concat id/cloud-directory "/bookmarks"))
;; Save cursor position when leave a buffer.
(save-place-mode +1)
(setq-default save-place-file(concat id/cloud-directory "/places"))

;; Store all backup and auto-save files in the temp directory.
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
;; Turn off saving whole session information.
(setq auto-save-list-file-prefix nil)
;; The blinking cursor is nothing, but an annoyance.
(blink-cursor-mode -1)
;; Disable the annoying bell ring.
(setq ring-bell-function 'ignore)
;; Disable startup screen.
(setq inhibit-startup-screen t)
;; Kill command remove carriage return also.
(setq kill-whole-line t)
;; Disable scroll-bar.
(scroll-bar-mode -1)
;; Mode line settings.
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)
;; Cycle through the mark ring.
(setq set-mark-command-repeat-pop t)
;; Stop update init.el by package-selected-packages.
(defun package--save-selected-packages (&rest opt)
  "Override default symbol to stop update init.el.
OPT required argument of the origin symbol."
  nil)
;; Enable y/n answers.
(fset 'yes-or-no-p 'y-or-n-p)
;; Always use echo area for yes-or-no prompt.
(setq use-dialog-box nil)
;; Emacs modes typically provide a standard means to change the
;; indentation width -- eg. c-basic-offset: use that to adjust your
;; personal indentation width, while maintaining the style (and
;; meaning) of any files you load.
(setq-default indent-tabs-mode nil)   ; Don't use tabs to indent.
(setq-default tab-width 4)            ; But maintain correct appearance.
;; Newline at end of file.
(setq require-final-newline t)
;; Intelligently breaks content into lines.
(auto-fill-mode +1)
;; Delete the selection with a key-press.
(delete-selection-mode t)
;; Highlight matched parentheses.
(show-paren-mode +1)
;; Revert (auto update) non file buffers, such as Dired buffers and
;; Buffer Menu.
(setq global-auto-revert-non-file-buffers t)
;; Disable notification of auto-reverting.
(setq auto-revert-use-notify nil)
;; Revert buffers automatically when underlying files are changed
;; externally.
(global-auto-revert-mode t)
;; UTF-8 only.
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
;; Emacs features.
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)

;;; Default keybindings.
;; Toggle.
(global-set-key (kbd "C-c t t") #'toggle-truncate-lines)
(global-set-key (kbd "C-c t w") #'whitespace-mode)
(global-set-key (kbd "C-c t n") #'global-display-line-numbers-mode)
