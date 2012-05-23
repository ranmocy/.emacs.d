;;; set-yasnippet.el --- Setup yasnippet

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

(add-to-el-get-sources
 '(:name yasnippet
         :type git
         :url "git://github.com/capitaomorte/yasnippet.git"
         :after (lambda ()
                  (autoload 'yas/global-mode "yasnippet" nil t)
                  (yas/global-mode 1))))

(eval-after-load "yasnippet"
  '(progn
     (setq yas/root-directory (expand-file-name "snippets" user-emacs-directory))
     (yas/load-directory yas/root-directory)
     (yas/load-directory (expand-file-name "snippets" (file-name-directory (locate-library "yasnippet"))))
     (yas/load-directory (expand-file-name "extras/imported" (file-name-directory (locate-library "yasnippet"))))
     (global-set-key [backtab] `yas/expand))
  )

(provide 'set-yasnippet)
;;; set-yasnippet.el ends here
