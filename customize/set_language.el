;;==============================Languages==============================
(setq default-major-mode 'text-mode)    ;设置默认地主模式为TEXT模式

(column-number-mode t)                  ;显示列号
(setq-default comment-style 'indent)    ;设定自动缩进的注释风格
(show-paren-mode t)                     ;显示括号匹配
(setq show-paren-style 'parentheses)    ;括号匹配显示但不是烦人的跳到另一个括号。
(setq blink-matching-paren nil)         ;当插入右括号时不显示匹配的左括号
(setq-default tab-width 2)              ;tab-width
(setq-default indent-tabs-mode nil)     ;disable tab
(transient-mark-mode 1)                 ;标记高亮
(global-font-lock-mode t)               ;语法高亮
(setq font-lock-maximum-decoration t)
(setq font-lock-global-modes '(not shell-mode text-mode))
(setq font-lock-verbose t)
(setq font-lock-maximum-size '((t . 1048576) (vm-mode . 5250000)))

;;----------yasnippet----------
(yas/initialize)
(setq yas/root-directory "~/.emacs.d/snippets")
(yas/load-directory yas/root-directory)

;;----------hippie-expand----------
(global-set-key [(meta ?/)] 'hippie-expand)
(setq hippie-expand-try-functions-list
      '(try-expand-dabbrev
        try-expand-dabbrev-visible
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-file-name-partially
        try-complete-file-name
        try-expand-all-abbrevs
        try-expand-list
        try-expand-line
        try-complete-lisp-symbol-partially
        try-complete-lisp-symbol))

;;--------------------lisp------------------------------
(setq max-lisp-eval-depth 40000)        ;lisp最大执行深度
(setq max-specpdl-size 10000)           ;最大容量
(setq eval-expression-print-length nil) ;设置执行表达式的长度没有限制
(setq eval-expression-print-level nil)  ;设置执行表达式的深度没有限制

;; ;;--------------------TeX--------------------
;; (setq load-path (cons "~/.emacs.d/auctex" load-path))
;; (load "auctex.el" nil t t)
;; (setq load-path (cons "~/.emacs.d/auctex/preview" load-path))
;; (load "preview-latex.el" nil t t)
;; (setq TeX-auto-save t)
;; ;;(setq TeX-parse-self t)
;; ;;(setq-default TeX-master nil)
;; (setq-default TeX-engine 'xelatex)
;; ;;(add-hook 'LaTeX-mode-hook 'LaTeX-install-toolbar)
;; ;;(add-hook 'LaTeX-mode-hook 'turn-on-auto-fill)
;; (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
;; (add-hook 'LaTeX-mode-hook 'tex-pdf-mode)

;;--------------------rails-project--------------------
;;slim
(require 'slim-mode)

;;helper-function
(defun is-rails-project ()
  (when (textmate-project-root)
    (file-exists-p (expand-file-name "config/environment.rb" (textmate-project-root)))))

(defun run-rails-test-or-ruby-buffer ()
  (interactive)
  (if (is-rails-project)
      (let* ((path (buffer-file-name))
             (filename (file-name-nondirectory path))
             (test-path (expand-file-name "test" (textmate-project-root)))
             (command (list ruby-compilation-executable "-I" test-path path)))
        (pop-to-buffer (ruby-compilation-do filename command)))
    (ruby-compilation-this-buffer)))
