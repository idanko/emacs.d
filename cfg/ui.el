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

(straight-use-package 'zenburn-theme)
(setq zenburn-scale-org-headlines t
      zenburn-scale-outline-headlines t)

;;; Frame setup.
(defun id/make-frame-function (&optional frame)
  "Set font and default keyboard type.
FRAME is an optional and is required by `after-make-frame-functions'."
  (interactive)
  (when frame
    (select-frame frame))
  (load-theme 'zenburn t)
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
                          :family "Iosevka Term" :height 110))))

;; Emacs client frame.
(add-hook 'after-make-frame-functions #'id/make-frame-function)
;; Normal frame running.
(add-hook 'after-init-hook #'id/make-frame-function)

;;; hl-todo.
(straight-use-package 'hl-todo)
(global-hl-todo-mode +1)
