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
  (defun mac-set-wicked-modifier-layout ()
    (interactive)
    (setq mac-command-modifier 'meta
          mac-right-command-modifier 'meta
          mac-option-modifier 'super
          mac-right-option-modifier 'super
          mac-control-modifier 'control
          mac-right-control-modifier 'control
          mac-function-modifier 'hyper)
    (message "Now, modifiers are wicked~"))

  (defun mac-set-normal-modifier-layout ()
    (interactive)
    (setq mac-command-modifier 'super
          mac-right-command-modifier 'super
          mac-option-modifier 'meta
          mac-right-option-modifier 'meta
          mac-control-modifier 'control
          mac-right-control-modifier 'control
          mac-function-modifier 'hyper)
    (message "Now, modifiers are normal again~"))

  (defun mac-set-modifier-layout (wicked)
    "This is the most wicked layout in the world, but it is good for your fingers.
It is more ergo. Parameter can be t or nil."
    (interactive "cWicked?(y/n)")
    (cond
     ((member wicked (list t ?y)) (mac-set-wicked-modifier-layout))
     ((member wicked (list nil ?n)) (mac-set-normal-modifier-layout))
     (t (message "Nothing happend."))))

  (mac-set-modifier-layout t)
  (setq mac-allow-anti-aliasing t))

(provide 'set-mac-modifier)
;;; set-mac-modifier.el ends here
