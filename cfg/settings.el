;;; ~/.emacs.d/cfg/settings.el -*- lexical-binding: t; -*-

(custom-set-variables
 '(org-roam-verbose nil)
 '(org-roam-db-location (concat id/cloud-directory "/org-roam.db"))
 '(org-roam-directory org-directory)
 '(org-roam-capture-templates
   '(("f" "find-file" plain (function org-roam--capture-get-point)
      "%?"
      :file-name "%<%Y%m%d%H%M%S>-${slug}"
      :head "#+TITLE: ${title}\n#+CREATED: %U\n#+LAST_MODIFIED: %U\n#+ROAM_TAGS: "
      :unnarrowed t))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cursor ((t (:background "#657B83"))))
 '(fringe ((t (:background "#f0e9d7"))))
 '(internal-border ((t (:background "black"))))
 '(line-number ((t (:background "#f0e9d7"))))
 '(mode-line ((t (:box (:line-width 1))))))
