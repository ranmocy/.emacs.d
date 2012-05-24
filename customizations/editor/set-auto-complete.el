;;; set-auto-complete.el --- Setup auto complete

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

;; 

;;; Code:

(add-to-el-get-sources
 '(:name auto-complete)
 '(:name auto-complete-clang)
 '(:name auto-complete-css)
 '(:name auto-complete-emacs-lisp)
 '(:name auto-complete-etags)
 '(:name auto-complete-extension)
 '(:name auto-complete-ruby)
 '(:name auto-complete-yasnippet)
 )

(setf ac-comphist-file (expand-file-name "ac-comphist.dat" personal-path))

(provide 'set-auto-complete)
;;; set-auto-complete.el ends here
