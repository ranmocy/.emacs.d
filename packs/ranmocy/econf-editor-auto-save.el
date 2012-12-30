;;; set-auto-save.el --- Setup auto save

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

;; Temp directory should be under temporary-file-directory. But in Mac OS
;; it is very hard to find it since it is randomly generated. I put them
;; in /tmp/emacs_<username>/autosaves/ which is the same directory of auto
;; backups.

;;; Code:

(set-as-system-type 'autosave-dir
                    :any (concat temporary-file-directory "emacs_autosaves")
                    :unixlike (concat "/tmp/emacs_" (user-login-name) "/autosaves/"))

(make-directory autosave-dir t)

(setq
 auto-save-default t
 auto-save-list-file-prefix (expand-file-name ".saveslist-" autosave-dir)
 auto-save-file-name-transforms `(("\\(?:[^/]*/\\)*\\(.*\\)" ,(concat autosave-dir "\\1") t))
 auto-save-interval 300
 auto-save-timeout 3
 trash-directory (expand-file-name "trash" autosave-dir)
 ;; auto-save-file-name-transforms `((".*" ,temporary-file-directory t))
 ;; auto-save-file-name-transforms `((".*" ,autosave-dir))
 )

(provide 'econf-editor-auto-save)
;;; set-auto-save.el ends here
