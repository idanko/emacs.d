;;; ~/.emacs.d/cfg/text/org.el -*- lexical-binding: t; -*-

;;; Settings.

(setq org-directory (concat id/cloud-directory "/org")
      org-default-notes-file (concat org-directory "/todo.org")
      org-my-default-journal-file (concat org-directory "/journal.org")
      org-todo-keywords '((sequence "TODO" "IN-PROGRESS" "DONE"))
      org-agenda-files (list org-default-notes-file)
      org-hide-emphasis-markers t
      org-startup-folded t)

(setq org-capture-templates
      '(("n" "[n]ew TODO item" entry (file org-default-notes-file)
         "* TODO %?\nEntered on %U\n")
        ("j" "[j]ournal" entry (file+datetree org-my-default-journal-file)
         "* %?\nEntered on %U\n")))

;; Key Bindings.
(evil-global-set-key 'normal (kbd "<leader> n a") #'org-agenda)
(evil-global-set-key 'normal (kbd "<leader> n c") #'org-capture)

(defun id/org-todo-new () (interactive) (org-capture nil "n"))
(evil-global-set-key 'normal (kbd "<leader> n n") #'id/org-todo-new)
(defun id/org-journal () (interactive) (org-capture nil "j"))
(evil-global-set-key 'normal (kbd "<leader> n j") #'id/org-journal)

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

(defun id/org-mode-hook ()
  (setq-local fill-column 80)
  (evil-define-key 'normal org-mode-map (kbd "<localleader> c *") #'id/org-toggle-fontifications))
(add-hook 'org-mode-hook #'id/org-mode-hook)

;;; Electric Pair Settings.
(defun id/org-fixup-electric-pairs ()
  (when (featurep 'elec-pair)
    ;; Disable electric-pair to insert match of <.
    (setq-local electric-pair-inhibit-predicate
                `(lambda (c) (if (char-equal c ?<) t (,electric-pair-inhibit-predicate c))))))

(add-hook 'org-mode-hook #'id/org-fixup-electric-pairs)
