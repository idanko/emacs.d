;;; ~/.emacs.d/cfg/navigation.el -*- lexical-binding: t; -*-

;;; Dired.
(with-eval-after-load 'dired
  ;; Act as Midnight Commander's panels.
  (setq dired-dwim-target t)
  (add-hook 'dired-mode-hook #'dired-hide-details-mode))
;; Fix the load pkg issue when open a file from CLI.
(require 'dired)
(evil-global-set-key 'normal (kbd "-") #'dired-jump)

;; Open file in Dired.
;; https://www.emacswiki.org/emacs/OperatingOnFilesInDired
(defun id/dired-open-file ()
  "In dired, open the file named on this line."
  (interactive)
  (let ((file (dired-get-filename nil t))
        (cmd (pcase system-type
               ('darwin "open")
               (_ "xdg-open"))))
    (call-process cmd nil 0 nil file)))

(with-eval-after-load 'dired
  (define-key dired-mode-map "E" #'id/dired-open-file)
  ;; override dired <SPC> with global <leader>
  (evil-define-key 'normal dired-mode-map (kbd "<SPC>") nil))

;;; Projectile.
(straight-use-package 'projectile)
(setq projectile-completion-system 'ivy)
(projectile-mode +1)

(define-key projectile-command-map "#" #'projectile-remove-known-project)
(evil-global-set-key 'normal (kbd "<leader> p") #'projectile-command-map)
(evil-global-set-key 'normal (kbd "<localleader> f f") #'projectile-find-file)
