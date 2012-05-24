(add-to-el-get-sources
 '(:name haml-mode
         :type elpa
         :after (lambda ()
                  (autoload 'haml-mode "haml-mode" nil t ))))

(provide 'set-haml-mode)
