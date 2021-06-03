;;; ~/.emacs.d/cfg/text/org-contrib.el -*- lexical-binding: t; -*-

;;; Org Roam.
(use-package org-roam
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
