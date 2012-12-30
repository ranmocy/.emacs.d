;;; econf-editor-mac-input.el --- Setup Mac OS X Input

;; Copyright (C) 2012  Ranmocy Sheng

;; Author: Ranmocy Sheng <ranmocy@gmail.com>
;; Keywords: econf, editor, mac, input, modifier

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
  (setq mac-command-modifier 'meta
	mac-right-command-modifier 'meta
	mac-option-modifier 'super
	mac-right-option-modifier 'super
	mac-control-modifier 'control
	mac-right-control-modifier 'control
	mac-function-modifier 'hyper)

  (setq ns-antialias-text t)
  (setq mouse-wheel-scroll-amount '(0.001)) ;Make mouse wheel / trackpad scrolling less jerky

  (when (window-system-p :cocoa)
    (defun new-empty-buffer ()
      "Opens a new empty buffer."
      (interactive)
      (let ((buf (generate-new-buffer "untitled")))
        (switch-to-buffer buf)
        (funcall (and initial-major-mode))
        (setq buffer-offer-save t)))

    ;; unset useless keys
    (global-unset-key (kbd "s-p"))
    (global-unset-key (kbd "s-o"))

    ;; system key
    (global-set-key (kbd "s-c") 'ns-copy-including-secondary)
    (global-set-key (kbd "s-v") 'ns-paste-secondary)
    ;; (global-set-key (kbd "M-h") 'ns-do-hide-emacs)
    ;; (eval-after-load 'nxml-mode
    ;;   '(define-key nxml-mode-map (kbd "M-h") nil))
    ;; (global-set-key (kbd "M-s-h") 'ns-do-hide-others) ;; what describe-key reports

    ;; new
    (global-set-key (kbd "s-n") 'new-empty-buffer)
    (global-set-key (kbd "s-N") 'new-frame)

    ;; switch
    (global-set-key (kbd "s-`") 'ns-next-frame)
    (global-set-key (kbd "M-`") 'other-window)
    (global-set-key (kbd "M-[") 'previous-multiframe-window)
    (global-set-key (kbd "M-]") 'next-multiframe-window)

    ;; kill
    (global-set-key (kbd "s-k") 'kill-this-buffer)
    (global-set-key (kbd "s-K") 'kill-buffer-and-window)
    )
  )

(provide 'econf-editor-mac-input)
;;; econf-editor-mac-input.el ends here
