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

(add-to-list 'package-archives '("tromey" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)

(setq prelude-guru nil)
(setq whitespace-line-column 160)       ; limit line length
(setq projectile-switch-project-action 'projectile-dired)
(setq dired-listing-switches "-ahoG")    ; change dired to all files, human readable size, no group info

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

;; Frames transparent when inactive
(set-frame-parameter nil 'alpha '(100 90))

;; Fonts
(when (eq system-type 'darwin)
  ;; Test Text: (大师)中文不是这样的`'""
  ;; Set default font
  (set-face-attribute 'default nil
                      :family "Inconsolata"
                      :height 180)
  ;; Set default font set for Chinese
  (set-fontset-font t 'cp936 (font-spec
                              :name "Microsoft YaHei"
                              :size 18)))

;; Start server daemon
(server-start)

(provide 'starter)
;;; starter.el ends here
