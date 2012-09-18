(add-to-el-get-sources
 '(:name less-mode
         :type git
         :url "git://github.com/myfreeweb/less-mode.git"
         :after (lambda ()
                  (autoload 'less-mode "less-mode" nil t)
                  (add-to-list 'auto-mode-alist '("\\.less$" . less-mode)))))

(provide 'econf-lang-less-mode)
