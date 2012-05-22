(add-to-el-get-sources
 '(:name ruby-mode
         :type git
         :url "git://github.com/david/ruby-mode.git"
         :load "ruby-mode.el"
         :after (lambda () (ruby-mode-hook)))
 '(:name inf-ruby
         :type elpa)
 '(:name ruby-compilation
         :type elpa)
 '(:name rvm
         :type git
         :url "http://github.com/djwhitt/rvm.el.git"
         :load "rvm.el"
         :compile ("rvm.el")
         :after (lambda () (rvm-use-default)))
 '(:name ruby-electric
         :type git
         :url "git://github.com/qoobaa/ruby-electric.git"
         :load "ruby-electric.el"))

(defun ruby-mode-hook ()
  (autoload 'ruby-mode "ruby-mode" nil t)
  (add-to-list 'auto-mode-alist '("Capfile" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Guardfile" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.ru\\'" . ruby-mode))
  (add-hook 'ruby-mode-hook
            '(lambda ()
               (setq ruby-deep-arglist t)
               (setq ruby-deep-indent-paren nil)
               (setq c-tab-always-indent nil)
               ;;(setq ruby-insert-encoding-magic-comment nil)
               ;;(remove-hook 'before-save-hook 'ruby-mode-set-encoding)
               ;;(defun ruby-mode-set-encoding () ())
               (require 'inf-ruby)
               (require 'ruby-compilation))))

(provide 'set-ruby-mode)
