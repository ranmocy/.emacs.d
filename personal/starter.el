;;; starter.el --- Startup

;; Copyright (C) 2013  Wanzhang Sheng

;; Author: Wanzhang Sheng <ranmocy@Wanzhangs-MacBook-Air.local>
;; Keywords: local

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Just startup for Ranmocy

;;; Code:

;; This buffer is for notes you don't want to save, and for Lisp evaluation.
;; If you want to create a file, visit that file with C-x C-f,
;; then enter the text in that file's own buffer.

(defconst custom-theme-load-path (list (expand-file-name "themes/" user-emacs-directory) t)
  "Some unpublished theme? Or Emacs defaults.")
(disable-theme 'zenburn)
(load-theme 'solarized-light)

(add-to-list 'package-archives '("tromey" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)

(setq prelude-guru nil)
(setq whitespace-line-column 160) ;; limit line length

;; Modifiers
(setq mac-command-modifier 'super)
(setq mac-option-modifier 'meta)
(setq mac-control-modifier 'control)
(setq mac-right-command-modifier 'super)
(setq mac-right-option-modifier 'meta)
(setq mac-right-control-modifier 'control)

;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time

;; Frames
(set-frame-parameter nil 'alpha '(100 90))

;; Fonts
(when (eq system-type 'darwin)
  ;; default Latin font (e.g. Consolas)
  ;; (set-default-font "YaHeiMono")
  ;; (大师)中文不是这样的
  ;; (set-default-font "Hei-18")
  ;; (set-default-font "Consolas")
  ;; (set-default-font "Heiti SC-18")
  ;; (set-frame-font "Heiti SC-18")
  ;; (set-default-font "YaHei Consolas Hybrid")
  ;; (set-face-attribute 'default nil :family "YaHeiMono")
  ;; default font size (point * 10)
  ;;
  ;; WARNING!  Depending on the default font,
  ;; if the size is not supported very well, the frame will be clipped
  ;; so that the beginning of the buffer may not be visible correctly.
  ;; (set-face-attribute 'default nil :height 165)
  ;; use specific font for Korean charset.
  ;; if you want to use different font size for specific charset,
  ;; add :size POINT-SIZE in the font-spec.
  (set-frame-font "DejaVu Sans Mono-18")
  ;; (set-frame-font "Menlo-18")
  ;; (set-fontset-font t 'hangul (font-spec :name "Inconsolata" :size 18))
  (set-fontset-font t 'cp936 (font-spec :name "Heiti SC" :size 18))
  ;; you may want to add different for other charset in this way.
  )

;; AC
(require 'auto-complete-config)
;; (add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20130503.2013")
(ac-config-default)
(setq ac-use-menu-map t)
;; Default settings
(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)

;; Snippets
(require 'yasnippet)
(setq yas-snippet-dirs
      (remove nil
              (list "~/.emacs.d/personal/snippets"
                    (when yas--load-file-name
                      (concat (file-name-directory yas--load-file-name) "snippets")))))
(yas-global-mode 1)

;; Indent-guide
(require 'indent-guide)
(indent-guide-global-mode)
;; (setq indent-guide-char "|")
(set-face-attribute 'indent-guide-face nil
                    :foreground "#CCC")

;; Start server daemon
(server-start)

(provide 'starter)
;;; starter.el ends here