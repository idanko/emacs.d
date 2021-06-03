;;; ~/.emacs.d/init.el -*- lexical-binding: t; -*-

;; Track Emacs start time.
(defvar time-emacs-start (current-time)
  "Time Emacs has started.")

(setq user-full-name "Illia Danko"
      user-mail-address "email@idanko.net")

(load "~/.emacs.d/cfg/preload.el")
(load "~/.emacs.d/cfg/package-manager.el")
(load "~/.emacs.d/cfg/core.el")
(load "~/.emacs.d/cfg/path.el")
(load "~/.emacs.d/cfg/dired.el")
(load "~/.emacs.d/cfg/completion.el")
(load "~/.emacs.d/cfg/diff.el")
(load "~/.emacs.d/cfg/edit.el")
(load "~/.emacs.d/cfg/search.el")
(load "~/.emacs.d/cfg/ui.el")
(load "~/.emacs.d/cfg/lsp.el")
(load "~/.emacs.d/cfg/buffer.el")
(load "~/.emacs.d/cfg/checkers.el")
(load "~/.emacs.d/cfg/vc.el")
(load "~/.emacs.d/cfg/terminal.el")
(load "~/.emacs.d/cfg/text/docker.el")
(load "~/.emacs.d/cfg/text/markdown.el")
(load "~/.emacs.d/cfg/text/org.el")
(load "~/.emacs.d/cfg/text/org-contrib.el")
(load "~/.emacs.d/cfg/text/web.el")
(load "~/.emacs.d/cfg/text/yaml.el")
(load "~/.emacs.d/cfg/lang/prog.el")
(load "~/.emacs.d/cfg/lang/c.el")
(load "~/.emacs.d/cfg/lang/sh.el")
(load "~/.emacs.d/cfg/lang/lisp.el")
(load "~/.emacs.d/cfg/lang/go.el")
(load "~/.emacs.d/cfg/lang/js.el")

;; Should be added in the end due to 'diminish.
(load "~/.emacs.d/cfg/modeline.el")
(setq custom-file "~/.emacs.d/cfg/settings.el")
(load custom-file)
(load "~/.emacs.d/cfg/postload.el")

;; Compute and show Emacs warm time.
(defvar time-emacs-loaded (time-since time-emacs-start)
  "Time Emacs has loaded.")
(message "Load time %.06f" (float-time time-emacs-loaded))
