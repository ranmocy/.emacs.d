(add-to-el-get-sources
 '(:name rhtml
         :type git
         :url "https://github.com/crazycode/rhtml.git"
         :features rhtml-mode
         :after (lambda () (rhtml-mode-hook))))

(defun rhtml-mode-hook ()
  (autoload 'rhtml-mode "rhtml-mode" nil t)
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . rhtml-mode))
  (add-to-list 'auto-mode-alist '("\\.rjs\\'" . rhtml-mode)))

(provide 'set-rhtml)
