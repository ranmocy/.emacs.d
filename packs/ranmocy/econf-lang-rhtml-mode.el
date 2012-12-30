(add-to-el-get-sources
 '(:name rhtml
         :type git
         :url "https://github.com/crazycode/rhtml.git"
         :features rhtml-mode
         :after (progn
                  (autoload 'rhtml-mode "rhtml-mode" nil t)
                  (add-to-list 'auto-mode-alist '("\\.erb\\'" . rhtml-mode))
                  (add-to-list 'auto-mode-alist '("\\.rjs\\'" . rhtml-mode)))))

(provide 'econf-lang-rhtml-mode)
