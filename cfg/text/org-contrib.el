;;; ~/.emacs.d/cfg/text/org-contrib.el -*- lexical-binding: t; -*-

;;; Org Roam.
(use-package org-roam
  :config
  (setq org-roam-verbose nil
        org-roam-directory org-directory
        org-roam-db-location (concat id/cloud-directory "/org-roam.db"))
  (setq org-roam-capture-templates
        '(("f" "find-file" plain (function org-roam--capture-get-point)
           "%?"
           :file-name "%<%Y%m%d%H%M%S>-${slug}"
           :head "#+TITLE: ${title}\n#+CREATED: %U\n#+LAST_MODIFIED: %U\n#+ROAM_TAGS: "
           :unnarrowed t)))
  :hook (after-init . org-roam-mode)
  :bind (:map org-roam-mode-map
              (("C-c n r" . org-roam)
               ("C-c n \\" . org-roam-db-build-cache)
               ("C-c n f" . org-roam-find-file)
               ("C-c n g" . org-roam-graph-show))))

;;; Org Drill (Flashcard Org Extension).
(use-package org-drill
  :after (org)
  :config
  :bind (:map org-mode-map
              (("C-c d" . org-drill))))
