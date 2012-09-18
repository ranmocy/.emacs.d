(add-to-el-get-sources
 '(:name haml-mode
         :type elpa
         :after (progn
                  (autoload 'haml-mode "haml-mode" nil t ))))

(provide 'econf-lang-haml-mode)
