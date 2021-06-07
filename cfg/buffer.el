;;; ~/.emacs.d/cfg/buffer.el -*- lexical-binding: t; -*-

;;; Key bindings.
(global-set-key (kbd "C-c b i") #'revert-buffer) ; (invigorate).
(global-set-key (kbd "C-c b r") #'counsel-recentf)

;;; Scratchpad buffer.
(defun id/open-scratchpad ()
  "Visit scratchpad file."
  (interactive)
  (find-file (concat id/cloud-directory "/scratchpad.txt")))
(global-set-key (kbd "C-c b s") #'id/open-scratchpad)

;;; Access buffer.
(defun id/open-access ()
  "Visit scratchpad file."
  (interactive)
  (find-file (concat id/cloud-directory "/access.gpg")))
(global-set-key (kbd "C-c b a") #'id/open-access)
