;;; ~/.emacs.d/cfg/text/org-contrib.el -*- lexical-binding: t; -*-

;;; Org Roam.
(straight-use-package 'org-roam)

(defun id/org-roam-hook ()
  (org-roam-mode +1)
  (define-key org-roam-mode-map (kbd "C-c n r") #'org-roam)
  (define-key org-roam-mode-map (kbd "C-c n \\") #'org-roam-db-build-cache)
  (define-key org-roam-mode-map (kbd "C-c n f") #'org-roam-find-file)
  (define-key org-roam-mode-map (kbd "C-c n g") #'org-roam-graph-show))
(add-hook 'after-init-hook #'id/org-roam-hook)


;;; Org Drill (Flashcard Org Extension).
(straight-use-package 'org-drill)
(with-eval-after-load 'org
  (define-key org-mode-map (kbd "C-c d") #'org-drill))
