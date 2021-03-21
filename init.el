;;; ~/.emacs.d/init.el -*- lexical-binding: t; -*-

;; Track Emacs start time.
(defvar time-emacs-start (current-time)
  "Time Emacs has started.")

(setq user-full-name "Illia Danko"
      user-mail-address "idanko@tuta.io")

(load "~/.emacs.d/conf/preload.el")
(load "~/.emacs.d/conf/package-manager.el")
(load "~/.emacs.d/conf/core.el")
(load "~/.emacs.d/conf/editor.el")
(load "~/.emacs.d/conf/path.el")
(load "~/.emacs.d/conf/completion.el")
(load "~/.emacs.d/conf/navigation.el")
(load "~/.emacs.d/conf/buffer.el")
(load "~/.emacs.d/conf/vc.el")
(load "~/.emacs.d/conf/diff.el")
(load "~/.emacs.d/conf/ui.el")
(load "~/.emacs.d/conf/tools.el")
(load "~/.emacs.d/conf/search.el")
(load "~/.emacs.d/conf/spell.el")
(load "~/.emacs.d/conf/modeline.el")
(load "~/.emacs.d/conf/lang/lang.el")
(load "~/.emacs.d/conf/lang/go.el")
(load "~/.emacs.d/conf/lang/lisp.el")
(load "~/.emacs.d/conf/lang/js.el")
(load "~/.emacs.d/conf/lang/sh.el")
(load "~/.emacs.d/conf/lang/c.el")
(load "~/.emacs.d/conf/text/yaml.el")
(load "~/.emacs.d/conf/text/org.el")
(load "~/.emacs.d/conf/text/org-contrib.el")
(load "~/.emacs.d/conf/text/web.el")
(load "~/.emacs.d/conf/text/docker.el")
(load "~/.emacs.d/conf/text/markdown.el")
;; Should be added in the end due to 'diminish.
(load "~/.emacs.d/conf/postload.el")

;; Compute and show Emacs warm time.
(defvar time-emacs-loaded (time-since time-emacs-start)
  "Time Emacs has loaded.")
(message "Load time %.06f" (float-time time-emacs-loaded))
