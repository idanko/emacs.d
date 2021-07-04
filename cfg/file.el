;;; ~/.emacs.d/cfg/file.el -*- lexical-binding: t; -*-

;;; Counsel.
(with-eval-after-load 'counsel
  (evil-global-set-key 'normal (kbd "<leader> f c") #'counsel-find-file)
  (evil-global-set-key 'normal (kbd "<leader> f r") #'counsel-recentf))

;;; Scratchpad buffer.
(defun id/open-scratchpad ()
  "Visit scratchpad file."
  (interactive)
  (find-file (concat id/cloud-directory "/scratchpad.txt")))

(evil-global-set-key 'normal (kbd "<leader> f s") #'id/open-scratchpad)

;;; Access buffer.
(defun id/open-access ()
  "Visit scratchpad file."
  (interactive)
  (find-file (concat id/cloud-directory "/access.gpg")))

(evil-global-set-key 'normal (kbd "<leader> f a") #'id/open-access)
