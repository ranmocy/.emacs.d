;;==============================Packages==============================
(load "set_hook.el")

(require 'package)
(setq package-archives (cons '("tromey" . "http://tromey.com/elpa/") package-archives))
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil t)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (end-of-buffer)
    (eval-print-last-sexp)))

(setq el-get-sources
      '((:name ruby-mode 
               :type elpa
               :load "ruby-mode.el"
               :after (lambda () (ruby-mode-hook)))
        (:name inf-ruby
               :type elpa)
        (:name ruby-compilation 
               :type elpa)
        (:name css-mode 
               :type elpa 
               :after (lambda () (css-mode-hook)))
        (:name textmate
               :type git
               :url "git://github.com/defunkt/textmate.el"
               :load "textmate.el")
        (:name rvm
               :type git
               :url "http://github.com/djwhitt/rvm.el.git"
               :load "rvm.el"
               :compile ("rvm.el")
               :after (lambda() (rvm-use-default)))
        (:name rhtml
               :type git
               :url "https://github.com/crazycode/rhtml.git"
               :features rhtml-mode
               :after (lambda () (rhtml-mode-hook)))
        (:name yaml-mode 
               :type git
               :url "http://github.com/yoshiki/yaml-mode.git"
               :features yaml-mode
               :after (lambda () (yaml-mode-hook)))
        (:name yasnippet-bundle
               :type elpa
               :load "yasnippet-bundle.el")
        (:name cucumber
               :type git
               :url "git://github.com/michaelklishin/cucumber.el.git"
               :load "feature-mode.el"
               :after (lambda () (feature-mode-hook)))
        (:name sass-mode
               :type elpa
               :load "sass-mode.el"
               :after (lambda () (sass-mode-hook)))
        (:name markdown-mode
               :load "markdown-mode.el"
               :after (lambda () (markdown-mode-hook)))
        ))

(el-get 'sync)
