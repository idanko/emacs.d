;;; ~/.emacs.d/cfg/file.el -*- lexical-binding: t; -*-

;;; Counsel.
(with-eval-after-load 'counsel
  (evil-global-set-key 'normal (kbd "<localleader> f f") #'counsel-find-file)
  (evil-global-set-key 'normal (kbd "<localleader> f r") #'counsel-recentf))

;;; Scratchpad buffer.
(defun id/open-scratchpad ()
  "Visit scratchpad file."
  (interactive)
  (find-file (concat id/cloud-directory "/scratchpad.txt")))

(evil-global-set-key 'normal (kbd "<localleader> f s") #'id/open-scratchpad)

;;; Access buffer.
(defun id/open-access ()
  "Visit scratchpad file."
  (interactive)
  (find-file (concat id/cloud-directory "/access.gpg")))

(evil-global-set-key 'normal (kbd "<localleader> f a") #'id/open-access)
