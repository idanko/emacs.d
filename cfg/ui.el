;;; ~/.emacs.d/cfg/ui.el -*- lexical-binding: t; -*-

;;; Settings.
;; The toolbar and menu is just a waste of valuable screen estate in a
;; tty tool-bar-mode does not properly auto-load, and is already.
;; disabled anyway.
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

;; Use menu bar only on OSX on graphic mode.
(when (and (fboundp 'menu-bar-mode)
           (not (and (string-equal system-type "darwin")
                     (display-graphic-p))))
  (menu-bar-mode -1))

(setq split-width-threshold 150) ; Split vertically always.

;;; Maximize window on start.
;; Fullscreen alist: '(fullscreen . fullboth).
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;;; Theme.
(defvar after-load-theme-hook nil
  "Hook run after a color theme is loaded using `load-theme'.")
(defadvice load-theme (after run-after-load-theme-hook activate)
  "Run `after-load-theme-hook'."
  (run-hooks 'after-load-theme-hook))

(use-package doom-themes
  :init
  :config
  (defun id/theme-fix ()
    (let ((face (pcase (car custom-enabled-themes)
                  ('doom-solarized-light
                   '((cursor-bg . "#657b83") (fringe-bg . "#f0e9d7")
                     (internal-border-bg . "black") (line-number-bg . "#f0e9d7")
                     (vertical-border-bg . "#f0e9d7")))
                  ('doom-zenburn
                   '((cursor-bg . "#ffffef") (fringe-bg . "#2b2b2b")
                     (internal-border-bg . "black") (line-number-bg . "#2b2b2b")
                     (vertical-border-bg . "#2b2b2b")))
                  (_ nil))))
      (when face
        (custom-set-faces
         `(cursor ((t (:background ,(alist-get 'cursor-bg face)))))
         `(fringe ((t (:background ,(alist-get 'fringe-bg face)))))
         `(internal-border ((t (:background ,(alist-get 'internal-border-bg face)))))
         `(line-number ((t (:background ,(alist-get 'line-number-bg face)))))
         '(mode-line ((t (:box (:line-width 1))))))
        (set-face-background 'vertical-border (alist-get 'vertical-border-bg face))
        (set-face-foreground 'vertical-border (face-background 'vertical-border))))))
(add-hook 'after-load-theme-hook #'id/theme-fix)

;;; Frame setup.
(defun id/make-frame-function (&optional frame)
  "Set font and default keyboard type.
FRAME is an optional and is required by `after-make-frame-functions'."
  (interactive)
  (when frame
    (select-frame frame))
  (load-theme 'doom-solarized-light t)
  (when (display-graphic-p)
    ;; OSX specific configuration.
    (when (string-equal system-type "darwin")
      (setq mac-option-modifier 'control)
      (setq mac-command-modifier 'meta)
      (set-face-attribute 'default nil
                          :family "Iosevka Term" :height 160)
      ;; Sets fn-delete to ;; be right-delete.
      (global-set-key [kp-delete] #'delete-char))
    (when (string-equal system-type "gnu/linux")
      ;; Change font size.
      (set-face-attribute 'default nil
                          :family "Iosevka" :height 110))))

;; Emacs client frame.
(add-hook 'after-make-frame-functions #'id/make-frame-function)
;; Normal frame running.
(add-hook 'after-init-hook #'id/make-frame-function)

;;; hl-todo.
(use-package hl-todo
  :config
  (global-hl-todo-mode +1))
