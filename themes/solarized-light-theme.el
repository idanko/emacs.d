;;; solarized-light-theme.el --- Light Emacs Theme  -*- lexical-binding:t -*-

;; Copyright (C) 2021 Free Software Foundation, Inc.

;; This file is part of GNU Emacs.

;; GNU Emacs is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <https://www.gnu.org/licenses/>.

;;; Code:

(deftheme solarized-light
  "A light Emacs theme
Created by Illia Danko (email@idanko.net)")

(custom-theme-set-faces
 'solarized-light
 '(default ((t (:background "#fdf6e3" :foreground "#586e75"))))
 '(mode-line ((t (:background "#eee8d5" :box (:line-width 1 :color "#586e75")))))
 '(mode-line-inactive ((t (:inherit mode-line :foreground "#93a1a1" :box nil))))
 '(font-lock-comment-delimiter-face ((t (:inherit font-lock-comment-face :weight bold))))
 '(font-lock-comment-face ((t (:foreground "#93a1a1"))))
 '(hl-line ((t (:background "#eee8d5"))))
 '(hl-paren-face ((t (:weight bold))) t)
 '(line-number ((t (:foreground "#839496" :background "#eee8d5"))))
 '(line-number-current-line ((t (:foreground "#657b83" :background "#eee8d5" :weight bold))))
 '(fringe ((t (:background "#eee8d5"))))
 '(vertical-border ((t (:background "#eee8d5" :foreground "#eee8d5"))))
 '(region ((t (:background "#93a1a1" :foreground "#fdf6e3"))))
 '(font-lock-string-face ((t (:inherit font-lock-constant-face))))
 '(font-lock-doc-face ((t (:inherit font-lock-string-face :slant italic))))
 '(font-lock-constant-face ((t (:foreground "#2aa198"))))
 '(font-lock-type-face ((t (:foreground "#b58900"))))
 '(font-lock-keyword-face ((t (:foreground "#859900"))))
 '(font-lock-function-name-face ((t (:foreground "#268bd2"))))
 '(font-lock-variable-name-face ((t (:inherit default))))
 '(font-lock-builtin-face ((t (:inherit font-lock-function-name-face))))
 '(isearch ((t (:background "#b58900" :foreground "#eee8d5"))))
 '(anzu-mode-line ((t (:inherit isearch :weight bold))))
 '(anzu-mode-line-no-match ((t (:inherit anzu-mode-line))))
 '(lazy-highlight ((t (:inherit region))))
 )

(provide-theme 'solarized-light)

;;; solarized-light-theme.el ends here
