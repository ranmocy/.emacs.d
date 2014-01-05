;;; editor.el --- boost editor

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

;; Improve Emacs as a editor.

;;; Code:

;; AC
(require 'auto-complete-config)
(ac-config-default)
(setq ac-use-menu-map t)
;; Default settings
(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)

;; Snippets
(require 'yasnippet)
(setq yas-snippet-dirs
      (remove nil
              (list "~/.emacs.d/personal/snippets"
                    (when yas--load-file-name
                      (concat (file-name-directory yas--load-file-name) "snippets")))))
(yas-global-mode 1)

;; Indent-guide
(require 'indent-guide)
(indent-guide-global-mode)
;; (setq indent-guide-char "|")
(set-face-attribute 'indent-guide-face nil
                    :foreground "#CCC")

;; Indent when yank
(defadvice yank (around html-yank-indent)
  (let ((point-before (point)))
    ad-do-it
    (when (eq major-mode 'html-mode) ;; check what mode we're in
      (indent-region point-before (point)))))
(ad-activate 'yank)

;; Uniq lines
(defun uniq-lines (beg end)
  "Unique lines in region.
Called from a program, there are two arguments:
BEG and END (region to sort)."
  (interactive "r")
  (save-excursion
    (save-restriction
      (narrow-to-region beg end)
      (goto-char (point-min))
      (while (not (eobp))
        (kill-line 1)
        (yank)
        (let ((next-line (point)))
          (while
              (re-search-forward
               (format "^%s" (regexp-quote (car kill-ring))) nil t)
            (replace-match "" nil nil))
          (goto-char next-line))))))

(provide 'editor)
;;; editor.el ends here
