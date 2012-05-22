(add-to-el-get-sources
 '(:name textmate
         :type git
         :url "git://github.com/defunkt/textmate.el"
         :load "textmate.el"))
(textmate-mode)

(provide 'set-textmate)
