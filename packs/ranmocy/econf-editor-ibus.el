;;; set-ibus.el --- Setup ibus in Emacs

;; Copyright (C) 2012  Ranmocy Sheng

;; Author: Ranmocy Sheng <ranmocy@gmail.com>
;; Keywords: 

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

;; 

;;; Code:

(when (system-type-p :linux)
  (require 'ibus)
  (global-set-key (kbd "C-\\") 'ibus-toggle)
  (ibus-define-common-key ?\C-\s nil)     ;Use C-SPC for Set Mark command
  (ibus-define-common-key ?\C-/ nil)      ;Use C-/ for Undo command
  (setq ibus-cursor-color '("yellow" "blue" "red")) ;Change cursor color depending on IBus status
  ;; Turn on ibus-mode automatically after loading .emacs
  (add-hook 'after-init-hook 'ibus-mode-on)
  (add-hook 'after-make-frame-functions
            (lambda (new-frame)
              (select-frame new-frame)
              (or ibus-mode (ibus-mode-on))))
  ;; Specific python2
  (setq ibus-python-shell-command-name "python2"))

(provide 'econf-editor-ibus)
;;; set-ibus.el ends here
