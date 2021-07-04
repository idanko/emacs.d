;;; ~/.emacs.d/cfg/core.el -*- lexical-binding: t; -*-

;;; Common Packages.
;; Hydra.
(straight-use-package 'hydra)

;; Which Key.
(straight-use-package 'which-key)
(which-key-mode +1)

;; Smex.
;; Sort and show the most recent commands at the top of counsel.
(straight-use-package 'smex)

;; Counsel.
(straight-use-package 'counsel)
(evil-global-set-key 'normal (kbd "<leader> :") #'counsel-M-x)

;; Ivy.
(straight-use-package 'ivy)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(setq ivy-height 15)
(setq ivy-initial-inputs-alist nil)
(ivy-mode +1)

;; Ivy Rich.
;; Show brief description on ivy menu.
(straight-use-package 'ivy-rich)
(ivy-rich-mode +1)

;;; Settings.
(defvar id/cloud-directory (expand-file-name "~/Dropbox/emacs")
  "ORG files system location.")
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
(evil-global-set-key 'normal (kbd "<localleader> t t") #'toggle-truncate-lines)
(evil-global-set-key 'normal (kbd "<localleader> t n") #'display-line-numbers-mode)
(evil-global-set-key 'normal (kbd "<localleader> t w") #'whitespace-mode)
