;;; ~/.emacs.d/cfg/text/org-contrib.el -*- lexical-binding: t; -*-

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
(evil-global-set-key 'normal (kbd "<leader> n \\") #'org-roam-db-build-cache)
(evil-global-set-key 'normal (kbd "<leader> n f") #'org-roam-find-file)
(evil-global-set-key 'normal (kbd "<leader> n g") #'org-roam-graph-show)
(evil-global-set-key 'normal (kbd "<leader> n r") #'org-roam)

;;; Org Drill (Flashcard Org Extension).
(straight-use-package 'org-drill)
(defun id/org-mode-hook-1 ()
  (unless (featurep 'org-drill)
    (require 'org-drill))
  (evil-define-key 'normal org-mode-map (kbd "<localleader> c d") #'org-drill))
(add-hook 'org-mode-hook #'id/org-mode-hook-1)

;;; Org Toggle Fontifications.
(defun id/org-toggle-fontifications ()
  "Toggle emphasis markers and the link display.
Toggle fontifications.
The idea stolen from https://github.com/zaeph/.emacs.d/blob/4548c34d1965f4732d5df1f56134dc36b58f6577/init.el#L3037-L3069"
  (interactive)
  ;; Toggle markers.
  (setq-local org-hide-emphasis-markers
              (not org-hide-emphasis-markers))
  ;; Toggle links.
  (if org-link-descriptive
      (remove-from-invisibility-spec '(org-link))
    (add-to-invisibility-spec '(org-link)))
  (setq-local org-link-descriptive
              (not org-link-descriptive))
  ;; Apply changes.
  (font-lock-fontify-buffer))

;; Org Bullets
(straight-use-package 'org-bullets)

;;; Hooks.
(defun id/org-mode-contrib-hook ()
  (org-bullets-mode +1)
  (evil-define-key 'normal org-mode-map (kbd "<localleader> t f") #'id/org-toggle-fontifications)
  (evil-define-key 'normal org-roam-mode-map (kbd "<localleader> r i") #'org-roam-insert-immediate))
(add-hook 'org-mode-hook #'id/org-mode-contrib-hook)
