;;; init.el
;; Ranmocy's Emacs Configurations -- A well-organized configurations.

;; Copyright (C) 2009, 2010, 2011, 2012
;; Author:   Ranmocy <Ranmocy@gmail.com>
;; Created:  someday in 2009
;; Updated:  2012-09-18
;; Version:  0.9.1-p0
;; Keywords: emacs, macos, linux, unixlike
;; Github:  `https://github.com/ranmocy/emacs_config'
;; GitCafe: `http://gitcafe.com/ranmocy/emacs_config'
;; Inspired-by: `https://github.com/overtone/emacs-live', `https://github.com/purcell/emacs.d'

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

;; Every file here should be packaged to `provide' a feature and be `require' by others.
;; Basically it can adapt to MacOS and any distribution of GNU/Linux.

;;; Code:

(add-to-list 'load-path (expand-file-name "packs/" user-emacs-directory))
(require 'econf nil t)

;; (unless (require 'econf nil t)
;;   (url-retrieve "https://raw.github.com/ranmocy/emacs.d/master/packs/econf.el"
;; 		(lambda (s) (save-buffer (expand-file-name "packs/econf.el" user-emacs-directory)))))

;;; init.el ends here
