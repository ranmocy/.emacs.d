;;; modes.el --- modes

;; Copyright (C) 2013  Wanzhang Sheng

;; Author: Wanzhang Sheng;; XeLaTeX <ranmocy@gmail.com>
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

;; Improve modes

;;; Code:

;; ruby-mode
(add-hook 'ruby-mode-hook
          (lambda () (rvm-activate-corresponding-ruby)))

;;set XeTeX mode in TeX/LaTeX
(add-hook 'LaTeX-mode-hook (lambda()
                             (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
                             (setq TeX-command-default "XeLaTeX")
                             (setq TeX-save-query nil)
                             (setq TeX-show-compilation t)))

;; dot-mode
(add-to-list 'auto-mode-alist '("\\.gv$" . graphviz-dot-mode))

;; C
;; Google style
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

;; javacc
(autoload 'javacc-mode "javacc-mode" "JavaCC mode" t)
(add-hook 'auto-mode-alist '("\\.jj$" . javacc-mode))
(add-hook 'auto-mode-alist '("\\.jjt$" . javacc-mode))
(add-hook 'javacc-mode-hook (lambda ()
                              (setq c-basic-offset 8
                                    tab-width 8)))

(provide 'modes)
;;; modes.el ends here
