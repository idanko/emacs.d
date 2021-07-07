;;; ~/.emacs.d/cfg/settings.el -*- lexical-binding: t; -*-

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-default-notes-file (concat id/org-directory "/todo.org"))
 '(org-agenda-files (list org-default-notes-file
                          (concat id/org-directory "/journal.org")))
 '(org-capture-templates
   `(("n" "[n]ew TODO item" entry
      (file org-default-notes-file)
      "* TODO %?
Entered on %U
")
     ("j" "[j]ournal" entry
      (file+datetree ,(concat id/org-directory "/journal.org"))
      "* %?
Entered on %U
")))
 '(org-directory id/org-directory)
 '(org-roam-capture-templates
   '(("f" "find-file" plain #'org-roam--capture-get-point "%?" :file-name "%<%Y%m%d%H%M%S>-${slug}" :head "#+TITLE: ${title}
#+CREATED: %U
#+LAST_MODIFIED: %U
#+ROAM_TAGS: " :unnarrowed t)))
 '(org-roam-db-location (concat id/cloud-directory "/org-roam.db"))
 '(org-roam-directory id/org-directory)
 '(org-roam-verbose nil)
 '(company-posframe-quickhelp-show-header nil)
 '(eldoc-echo-area-use-multiline-p nil)  ;; better el-doc popoup
 '(git-gutter:modified-sign "▌")
 '(git-gutter:added-sign "▌")
 '(git-gutter:deleted-sign "▌")
 '(git-gutter:hide-gutter t))

