;;; keybindings.el --- Binding Keys

;; Copyright (C) 2013  Wanzhang Sheng

;; Author: Wanzhang Sheng <ranmocy@Wanzhangs-MacBook-Air.local>
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

;; A replacement of prelude-mode bindings

;;; Code:

;; Disable it first
(prelude-global-mode '-1)

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


;; Key Bindings
(global-set-key [(super return)] 'prelude-smart-open-line)
(global-set-key [(super shift return)] 'prelude-smart-open-line-above)
(global-set-key (kbd "s-n") 'prelude-create-scratch-buffer)
(global-set-key (kbd "s-N") 'new-frame)
(global-set-key (kbd "s-w") 'kill-this-buffer-unless-some)
(global-set-key (kbd "s-W") 'delete-frame)
(global-set-key (kbd "s-o") 'prelude-recentf-ido-find-file)
(global-set-key (kbd "s-O") 'prelude-open-with)
(global-set-key (kbd "s-`") 'other-window)
(global-set-key (kbd "C-c s") 'prelude-swap-windows)
(global-set-key (kbd "C-c D") 'prelude-delete-file-and-buffer)
(global-set-key (kbd "C-c r") 'prelude-rename-file-and-buffer)
(global-set-key (kbd "C-c t") 'prelude-visit-term-buffer)
(global-set-key (kbd "C-c k") 'prelude-kill-other-buffers)

(global-set-key (kbd "s-p") 'projectile-switch-project)
(global-set-key (kbd "s-f") 'projectile-find-file)
(global-set-key (kbd "s-g") 'projectile-grep)

(global-set-key (kbd "s-x") 'er/expand-region)
(global-set-key (kbd "s-j") 'join-region)
(global-set-key (kbd "s-k") 'prelude-kill-whole-line)

;; (global-set-key (kbd "C-?") 'help-command)
(global-set-key (kbd "M-H") 'mark-paragraph)
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-h") 'backward-kill-word)

;; Edit
(global-set-key [(control shift up)]  'prelude-move-line-up)
(global-set-key [(control shift down)]  'prelude-move-line-down)
(global-set-key [(meta shift up)]  'prelude-move-line-up)
(global-set-key [(meta shift down)]  'prelude-move-line-down)
(global-set-key (kbd "C-c d") 'prelude-duplicate-current-line-or-region)
(global-set-key (kbd "C-c M-d") 'prelude-duplicate-and-comment-current-line-or-region)
(global-set-key (kbd "C-c +") 'prelude-increment-integer-at-point)
(global-set-key (kbd "C-c -") 'prelude-decrement-integer-at-point)
;; Lisp
(global-set-key (kbd "C-c e") 'prelude-eval-and-replace)
(global-set-key (kbd "C-M-z") 'prelude-indent-defun)
(global-set-key (kbd "C-c TAB") 'prelude-indent-rigidly-and-copy-to-clipboard)
;; Multi Cursors
(global-set-key (kbd "s-L") 'mc/edit-lines)
(global-set-key (kbd "s-d") 'mc/mark-next-like-this)
(global-set-key (kbd "s-D") 'mc/mark-previous-like-this)
(global-set-key (kbd "s-C-D") 'mc/mark-all-like-this)
(global-set-key (kbd "s-<mouse-1>") 'mc/add-cursor-on-click)

;; Miscs
(global-set-key (kbd "s-b") 'ibuffer)
;; (global-set-key (kbd "s-d") 'projectile-find-dir)
(global-set-key (kbd "s-m") 'magit-status)
(global-set-key (kbd "s-h") 'helm-prelude)
(global-set-key (kbd "C-c g") 'prelude-google)
(global-set-key (kbd "C-c y") 'prelude-youtube)
(global-set-key (kbd "C-c u") 'prelude-view-url)
(global-set-key (kbd "C-M-\\") 'prelude-indent-region-or-buffer)

(provide 'keybindings)
;;; keybindings.el ends here
