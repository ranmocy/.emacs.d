(add-to-el-get-sources
 '(:name ruby-mode
         :type git
         :url "git://github.com/emacsmirror/ruby-mode.git"
         ;; :load "ruby-mode.el"
         :after (lambda ()
                  (autoload 'ruby-mode "ruby-mode" nil t)
                  (add-to-list 'auto-mode-alist '("Capfile" . ruby-mode))
                  (add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
                  (add-to-list 'auto-mode-alist '("Guardfile" . ruby-mode))
                  (add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
                  (add-to-list 'auto-mode-alist '("\\.gemspec\\'" . ruby-mode))
                  (add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
                  (add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-mode))
                  (add-to-list 'auto-mode-alist '("\\.ru\\'" . ruby-mode))))
 '(:name inf-ruby
         :type elpa
         :autoloads nil)
 '(:name ruby-compilation
         :type elpa
         :autoloads nil)
 '(:name rvm
         :type git
         :autoloads nil
         :url "http://github.com/djwhitt/rvm.el.git")
 '(:name ruby-electric
         :type git
         :url "git://github.com/qoobaa/ruby-electric.git"
         :autoloads nil)
 )

(eval-after-load "ruby-mode"
  '(progn
     ;; (require 'inf-ruby)
     ;; (require 'ruby-compilation)
     ;; (require 'ruby-electric)
     ;; (require 'rvm)
     (add-hook 'ruby-mode-hook
               '(lambda ()
                  (setq ruby-deep-arglist t)
                  (setq ruby-deep-indent-paren nil)
                  (setq c-tab-always-indent nil)
                  ;;(setq ruby-insert-encoding-magic-comment nil)
                  ;;(remove-hook 'before-save-hook 'ruby-mode-set-encoding)
                  ;;(defun ruby-mode-set-encoding () ())
                  ))))

(eval-after-load "rvm"
  '(rvm-use-default))

(provide 'econf-lang-ruby-mode)
