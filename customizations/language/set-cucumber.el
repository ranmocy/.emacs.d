(add-to-el-get-sources
 '(:name cucumber
         :type git
         :url "git://github.com/michaelklishin/cucumber.el.git"
         :after (lambda ()
                  (autoload 'feature-mode "feature-mode" nil t)
                  (add-to-list 'auto-mode-alist '("\.feature$" . feature-mode)))))

(provide 'set-cucumber)