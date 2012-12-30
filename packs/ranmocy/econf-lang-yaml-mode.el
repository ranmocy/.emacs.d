(add-to-el-get-sources
 '(:name yaml-mode
         :type git
         :url "http://github.com/yoshiki/yaml-mode.git"
         :features yaml-mode
         :after (progn
                  (autoload 'yaml-mode "yaml-mode" nil t)
                  (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
                  (add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode)))))

(provide 'econf-lang-yaml-mode)
