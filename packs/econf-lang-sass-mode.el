(add-to-el-get-sources
  '(:name sass-mode
         :type elpa
         :after (progn
                  (autoload 'sass-mode "sass-mode" nil t)
                  (add-to-list 'auto-mode-alist '("\.scss$" . sass-mode))
                  (add-to-list 'auto-mode-alist '("\.sass$" . sass-mode))))
 '(:name scss-mode
         :type git
         :url "git://github.com/antonj/scss-mode.git"
         :after (progn
                  (autoload 'scss-mode "scss-mode" nil t)
                  (add-to-list 'auto-mode-alist '("\.scss$" . scss-mode))
                  (setq scss-compile-at-save nil)))
)

(provide 'econf-lang-sass-mode)
