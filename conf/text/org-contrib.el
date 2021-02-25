;;; ~/.emacs.d/conf/text/org-contrib.el -*- lexical-binding: t; -*-

;;; Org Roam.
(straight-use-package 'org-roam)
(require 'org-roam)

(setq org-roam-verbose nil
      org-roam-directory org-directory
      org-roam-db-location (concat id/cloud-directory "/org-roam.db"))

(setq org-roam-capture-templates
      '(("f" "find-file" plain (function org-roam--capture-get-point)
         "%?"
         :file-name "%<%Y%m%d%H%M%S>-${slug}"
         :head "#+TITLE: ${title}\n#+CREATED: %U\n#+LAST_MODIFIED: %U\n#+ROAM_TAGS: "
         :unnarrowed t)))

;; Key Bindings.
(global-set-key (kbd "C-c n \\") #'org-roam-db-build-cache)
(global-set-key (kbd "C-c n f") #'org-roam-find-file)
(global-set-key (kbd "C-c n g") #'org-roam-graph-show)
(global-set-key (kbd "C-c n r") #'org-roam)

;;; Org Drill (Flashcard Org Extension).
(straight-use-package 'org-drill)
(defun id/org-mode-hook-1 ()
  (unless (featurep 'org-drill)
    (require 'org-drill))
  (define-key org-mode-map (kbd "C-c d") #'org-drill))
(add-hook 'org-mode-hook #'id/org-mode-hook-1)
