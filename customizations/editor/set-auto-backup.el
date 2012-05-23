;;; set-auto-backup.el --- Setup auto backup

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
;; in /tmp/emacs_<username>/backups/ which is the same directory of auto
;; save.

;;; Code:

(if (system-type-unix-like-p)
    (setq backup-dir (concat "/tmp/emacs_" (user-login-name) "/backups/"))
  (setq backup-dir (concat temporary-file-directory "emacs_backups"))
  )

(make-directory backup-dir t)

(setq
 backup-by-copying t
 backup-directory-alist `((".*" . ,backup-dir))
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t
 )

(provide 'set-auto-backup)
;;; set-auto-backup.el ends here
