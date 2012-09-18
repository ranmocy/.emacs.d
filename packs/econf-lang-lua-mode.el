(add-to-el-get-sources
 '(:name lua-mode
         :type elpa
         :after (lambda ()
                  (autoload 'lua-mode "lua-mode.el" nil t))))

(provide 'econf-lang-lua-mode)
