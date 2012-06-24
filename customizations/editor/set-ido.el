;;; set-ido.el --- Setup ido mode

;; Copyright (C) 2012  Ranmocy Sheng

;; Author: Ranmocy Sheng <ranmocy@gmail.com>
;; Keywords: extensions

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

;; use ido for minibuffer completion

;;; Code:

(require 'ido)
(ido-mode t)
(setq ido-save-directory-list-file (expand-file-name ".ido.last" personal-path))
(setq ido-enable-flex-matching t)
;; (setq ido-use-filename-at-point 'guess)
(setq ido-show-dot-for-dired t)

(provide 'set-ido)
;;; set-ido.el ends here
