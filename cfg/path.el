;;; ~/.emacs.d/cfg/path.el -*- lexical-binding: t; -*-

;;; Find executables used by packages.
(when (display-graphic-p)
  (setq exec-path (append exec-path '("/usr/local/bin")))
  (setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
  (setq exec-path (append exec-path '("~/go/bin")))
  (setenv "PATH" (concat (getenv "PATH") ":~/go/bin"))
  (setq exec-path (append exec-path '("/usr/local/go/bin")))
  (setenv "PATH" (concat (getenv "PATH") ":/usr/local/go/bin")))
