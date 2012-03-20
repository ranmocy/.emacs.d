;;==============================Packages==============================
(require 'package)
(setq package-archives (cons '("tromey" . "http://tromey.com/elpa/") package-archives))
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil t)
  (url-retrieve "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
                (lambda (s) (end-of-buffer) (eval-print-last-sexp))))

(setq el-get-sources
      '(
        ;; (:name wanderlust
        ;;        :type el-get
        ;;        )
        (:name yasnippet
               :type git
               :url "git://github.com/capitaomorte/yasnippet.git"
               :after (lambda () (yasnippet-hook)))
        ;; (:name yasnippet-bundle
        ;;        :type elpa
        ;;        :load "yasnippet-bundle.el")
        (:name textmate
               :type git
               :url "git://github.com/defunkt/textmate.el"
               :load "textmate.el")

        ;; Ruby
        (:name ruby-mode 
               :type git
               :url "git://github.com/david/ruby-mode.git"
               :load "ruby-mode.el"
               :after (lambda () (ruby-mode-hook)))
        (:name inf-ruby
               :type elpa)
        (:name ruby-compilation 
               :type elpa)
        (:name rvm
               :type git
               :url "http://github.com/djwhitt/rvm.el.git"
               :load "rvm.el"
               :compile ("rvm.el")
               :after (lambda () (rvm-use-default)))
        (:name ruby-electric
               :type git
               :url "git://github.com/qoobaa/ruby-electric.git"
               :load "ruby-electric.el")


        ;; File Modes
        (:name markdown-mode
               :load "markdown-mode.el"
               :after (lambda () (markdown-mode-hook)))
        (:name rhtml
               :type git
               :url "https://github.com/crazycode/rhtml.git"
               :features rhtml-mode
               :after (lambda () (rhtml-mode-hook)))
        (:name css-mode 
               :type elpa 
               :after (lambda () (css-mode-hook)))
        (:name yaml-mode 
               :type git
               :url "http://github.com/yoshiki/yaml-mode.git"
               :features yaml-mode
               :after (lambda () (yaml-mode-hook)))
        (:name haml-mode
               :type elpa
               :load "haml-mode.el")
        (:name sass-mode
               :type elpa
               :load "sass-mode.el"
               :after (lambda () (sass-mode-hook)))
        (:name lua-mode
               :type elpa
               :load "lua-mode.el")
        (:name cucumber
               :type git
               :url "git://github.com/michaelklishin/cucumber.el.git"
               :load "feature-mode.el"
               :after (lambda () (feature-mode-hook)))

        ;; Rails
        (:name rinari
               :type elpa)
        )
      )
(el-get 'sync
        (append '(el-get google-maps)
                (mapcar 'el-get-source-name el-get-sources)))
