(add-to-el-get-sources
 '(:name slim-mode
         :type git
         :url "git://github.com/minad/emacs-slim.git"))

(autoload 'slim-mode "slim-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.slim$" . slim-mode))

(provide 'econf-lang-slim-mode)
