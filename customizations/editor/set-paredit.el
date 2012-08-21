;;; set-paredit.el --- Setup paredit

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

(defun paredit-mode-hook ()
  (paredit-mode +1)
  (local-set-key (kbd "C-h") 'paredit-backward-delete))

(add-to-el-get-sources
 '(:name paredit
         :type git
         :url "git://github.com/emacsmirror/paredit.git"
         :after (lambda ()
                  (autoload 'paredit-mode "paredit"
                    "Minor mode for pseudo-structurally editing Lisp code." t)
                  (add-hook 'emacs-lisp-mode-hook       #'paredit-mode-hook)
                  (add-hook 'lisp-mode-hook             #'paredit-mode-hook)
                  (add-hook 'lisp-interaction-mode-hook #'paredit-mode-hook)
                  (add-hook 'scheme-mode-hook           #'paredit-mode-hook))))

(eval-after-load "paredit"
  '(progn ;; type parens in pairs with Hyper and right hands's home-row
     (define-key paredit-mode-map (kbd "H-{") (lambda () (interactive) (insert "{}") (backward-char 1)))
     (define-key paredit-mode-map (kbd "H-(") (lambda () (interactive) (insert "()") (backward-char 1)))
     (define-key paredit-mode-map (kbd "H-[") (lambda () (interactive) (insert "[]") (backward-char 1)))
     ))

(provide 'set-paredit)
;;; set-paredit.el ends here
