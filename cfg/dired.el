;;; ~/.emacs.d/cfg/dired.el -*- lexical-binding: t; -*-

;;; Dired.
(with-eval-after-load 'dired
  ;; Act as Midnight Commander's panels.
  (setq dired-dwim-target t)
  (add-hook 'dired-mode-hook #'dired-hide-details-mode)
  (require 'dired)
  ;; Fix the load pkg issue when open a file from CLI.
  (global-set-key [remap dired] #'dired-jump))

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
  (define-key dired-mode-map "E" #'id/dired-open-file))
