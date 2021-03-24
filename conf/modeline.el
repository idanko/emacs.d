;;; ~/.emacs.d/conf/modeline.el -*- lexical-binding: t; -*-

(defvar modeline-minor-white-list '(flycheck-mode)
  "The whitelist of the minor modes being shown on the modeline.")

;;; Turn off minor modes.
;; https://emacs.stackexchange.com/questions/3925/hide-list-of-minor-modes-in-mode-line#answer-3928
(defun purge-minor-modes ()
  (interactive)
  (setq minor-mode-alist
        (mapcar (lambda (x)
                  (if (member (car x) modeline-minor-white-list)
                      x
                    `(,(car x) "")))
                minor-mode-alist)))

(add-hook 'after-change-major-mode-hook 'purge-minor-modes)
