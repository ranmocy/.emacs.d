;;; set-search.el --- Setup search char

;; Copyright (C) 2012  Ranmocy Sheng

;; Author: Ranmocy Sheng <ranmocy@gmail.com>
;; Keywords: lisp, extensions

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

(defun search-and-go-to-char (n char)
  "Move forward to Nth occurence of CHAR.
 Typing `wy-go-to-char-key' again will move forwad to the next Nth
 occurence of CHAR."
  (interactive "p\ncGo to char: ")
  (search-forward (string char) nil nil n)
  (while (char-equal (read-char) char)
    (search-forward (string char) nil nil n))
  (setq unread-command-events (list last-input-event)))

(global-set-key (kbd "C-` C-s") 'search-and-go-to-char)

(provide 'set-search)
;;; set-search.el ends here
