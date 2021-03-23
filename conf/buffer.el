;;; ~/.emacs.d/conf/buffer.el -*- lexical-binding: t; -*-

;;; Key bindings.
(global-set-key (kbd "C-c b i") #'revert-buffer) ; (invigorate).
(global-set-key (kbd "C-c b r") #'counsel-recentf)

;;; Scratchpad buffer.
(defun id/open-scratchpad ()
  "Visit scratchpad file."
  (interactive)
  (find-file (concat id/cloud-directory "/scratchpad.txt")))

(global-set-key (kbd "C-c b s") #'id/open-scratchpad)
