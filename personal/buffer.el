;;; buffer.el --- boost buffer

;; Copyright (C) 2013  Wanzhang Sheng

;; Author: Wanzhang Sheng <ranmocy@gmail.com>
;; Keywords: local

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

;; Improve the buffer behaviors.

;;; Code:

;; ibuffer auto-mode
(add-hook 'ibuffer-mode-hook (lambda () (ibuffer-auto-mode)))

;; Kill some buffers
(defcustom protected-buffer-list '("*scratch*" "*Messages*")
  "The buffers you want to protect to be closed."
  :group 'prelude-buffer
  :type 'list
  :safe 'listp)

(defun kill-this-buffer-unless-some ()
  "Kill this buffer unless it in `protected-buffer-list'."
  (interactive)
  (if (member (buffer-name (current-buffer)) protected-buffer-list)
      (bury-buffer)
    (kill-buffer (current-buffer))))

(defun join-region (beg end)
  "Apply `join-line' over region from BEG to END."
  (interactive "r")
  (if mark-active
      (let ((beg (region-beginning))
            (end (copy-marker (region-end))))
        (goto-char beg)
        (while (< (point) end)
          (join-line 1)))
    (join-line 1)))

(require 'ibuffer-vc)
(add-hook 'ibuffer-hook
          (lambda ()
            (ibuffer-vc-set-filter-groups-by-vc-root)
            (unless (eq ibuffer-sorting-mode 'alphabetic)
              (ibuffer-do-sort-by-alphabetic))))
(setq ibuffer-formats
      '((mark modified read-only vc-status-mini " "
              (name 18 18 :left :elide)
              " "
              (size 9 -1 :right)
              " "
              (mode 16 16 :left :elide)
              " "
              (vc-status 16 16 :left)
              " "
              filename-and-process)))

(provide 'buffer)
;;; buffer.el ends here
