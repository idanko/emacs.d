;;; ~/.emacs.d/cfg/terminal.el -*- lexical-binding: t; -*-

;;; Xclip.
;; Yank to clipboard in the terminal.
(straight-use-package 'xclip)
(unless (display-graphic-p)
  (xclip-mode +1))

;;; Ansi term.
(defun id/swtich-to-ansi-term ()
  (interactive)
  (if (seq-filter (lambda (buf)
                    (string-equal (buffer-name buf) "*ansi-term*"))
                  (buffer-list))
      (switch-to-buffer "*ansi-term*")
    (call-interactively #'ansi-term)))

(global-set-key (kbd "C-c t a") #'id/swtich-to-ansi-term)

;;; VTerm.
(straight-use-package 'vterm)
(global-set-key (kbd "C-c t t") #'vterm)
