(require 'set-hippie-expand)
(require 'set-lisp)
(require 'set-rails)
(require 'set-auctex)

(setq
 default-major-mode 'text-mode         ;设置默认地主模式为TEXT模式
 show-paren-style 'parentheses         ;括号匹配显示但不是烦人的跳到另一个括号。
 blink-matching-paren nil              ;当插入右括号时不显示匹配的左括号
 )

(setq-default
 comment-style 'indent                  ;设定自动缩进的注释风格
 tab-width 2                            ;tab-width
 indent-tabs-mode nil)                  ;disable tab
(column-number-mode t)                  ;显示列号
(show-paren-mode t)                     ;显示括号匹配
(transient-mark-mode 1)                 ;标记高亮
(global-font-lock-mode t)               ;语法高亮
(setq font-lock-maximum-decoration t)
(setq font-lock-global-modes '(not shell-mode text-mode))
(setq font-lock-verbose t)
(setq font-lock-maximum-size '((t . 1048576) (vm-mode . 5250000)))

;; auto mode alist
(add-to-list 'auto-mode-alist '("\\.zsh$" . shell-script-mode))
(add-to-list 'auto-mode-alist '("zshrc$" . shell-script-mode))

;; Ruby + Rails
(add-to-el-get-sources
 '(:name ruby-mode
         :type git
         :url "git://github.com/david/ruby-mode.git"
         :load "ruby-mode.el"
         :after (lambda () (ruby-mode-hook)))
 '(:name inf-ruby
         :type elpa))

;; '(:name ruby-compilation
;;         :type elpa)
;; '(:name rvm
;;         :type git
;;         :url "http://github.com/djwhitt/rvm.el.git"
;;         :load "rvm.el"
;;         :compile ("rvm.el")
;;         :after (lambda () (rvm-use-default)))
;; '(:name ruby-electric
;;         :type git
;;         :url "git://github.com/qoobaa/ruby-electric.git"
;;         :load "ruby-electric.el")
;; '(:name rinari
;;         :type elpa)

;; ;; File Modes
;; '(:name markdown-mode
;;         :load "markdown-mode.el"
;;         :after (lambda () (markdown-mode-hook)))
;; '(:name rhtml
;;         :type git
;;         :url "https://github.com/crazycode/rhtml.git"
;;         :features rhtml-mode
;;         :after (lambda () (rhtml-mode-hook)))
;; '(:name css-mode
;;         :type elpa
;;         :after (lambda () (css-mode-hook)))
;; '(:name yaml-mode
;;         :type git
;;         :url "http://github.com/yoshiki/yaml-mode.git"
;;         :features yaml-mode
;;         :after (lambda () (yaml-mode-hook)))
;; '(:name haml-mode
;;         :type elpa
;;         :load "haml-mode.el")
;; '(:name sass-mode
;;         :type elpa
;;         :load "sass-mode.el"
;;         :after (lambda () (sass-mode-hook)))
;; '(:name lua-mode
;;         :type elpa
;;         :load "lua-mode.el")
;; '(:name cucumber
;;         :type git
;;         :url "git://github.com/michaelklishin/cucumber.el.git"
;;         :load "feature-mode.el"
;;         :after (lambda () (feature-mode-hook)))


;; language mode hooks
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

(defun rhtml-mode-hook ()
  (autoload 'rhtml-mode "rhtml-mode" nil t)
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . rhtml-mode))
  (add-to-list 'auto-mode-alist '("\\.rjs\\'" . rhtml-mode)))

(defun yaml-mode-hook ()
  (autoload 'yaml-mode "yaml-mode" nil t)
  (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
  (add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode)))

(defun css-mode-hook ()
  (autoload 'css-mode "css-mode" nil t)
  (add-hook 'css-mode-hook '(lambda ()
                              (setq css-indent-level 2)
                              (setq css-indent-offset 2))))

(defun feature-mode-hook ()
  (autoload 'feature-mode "feature-mode" nil t)
  (add-to-list 'auto-mode-alist '("\.feature$" . feature-mode)))

(defun sass-mode-hook ()
  (autoload 'sass-mode "sass-mode" nil t)
  (add-to-list 'auto-mode-alist '("\.scss$" . sass-mode))
  (add-to-list 'auto-mode-alist '("\.sass$" . sass-mode)))

(defun markdown-mode-hook ()
  (autoload 'markdown-mode "markdown-mode.el" nil t)
  (add-to-list 'auto-mode-alist '("\\.\\(markdown\\|md\\|text\\)$" . markdown-mode))
  (define-key markdown-mode-map
    (kbd "<tab>")
    (lambda()
      (interactive)
      (let ((yas/fallback-behavior 'return-nil))
        (unless (yas/expand)
          (message "markdown-cycle should be called")
          (markdown-cycle))))))

(provide 'set-language)
