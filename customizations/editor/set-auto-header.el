;;; set-auto-header.el --- Setup auto header

;; Copyright (C) 2012  Ranmocy Sheng

;; Author: Ranmocy Sheng <ranmocy@gmail.com>
;; Keywords: lisp

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

;; auto-insert-directory should just under user-emacs-directory

;;; Code:

(setq auto-insert-directory (expand-file-name "auto-insert/" user-emacs-directory))
(add-hook 'find-file-hook 'auto-insert)
(auto-insert-mode 1)

(provide 'set-auto-header)
;;; set-auto-header.el ends here
