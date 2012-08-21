
;;; set-mac-modifier.el --- Setup Mac OS X modifier

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

(when (system-type-p :darwin)
  (defun mac-set-wicked-modifier-layout (wicked)
    "This is the most wicked layout in the world, but it is good for your fingers. It is more ergo."
    (setq mac-command-modifier 'meta)
    (setq mac-right-command-modifier 'meta)
    (setq mac-option-modifier 'super)
    (setq mac-right-option-modifier 'super)
    (setq mac-control-modifier 'control)
    (setq mac-right-control-modifier 'control)
    (setq mac-function-modifier 'super)

    (interactive "cWicked?")
    (if (eq wicked t)
        (progn
          (setq mac-option-modifier 'control)
          (setq mac-right-option-modifier 'control)
          ))

    wicked)

  (global-set-key "\M- " 'set-mark-command)
  (mac-set-wicked-modifier-layout t)
  (setq mac-allow-anti-aliasing t))

(provide 'set-mac-modifier)
;;; set-mac-modifier.el ends here
