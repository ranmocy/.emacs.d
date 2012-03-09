;;====================Languages====================
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

;;--------------------hippie-expand--------------------
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

;;--------------------lisp--------------------
(setq
 max-lisp-eval-depth 40000              ;lisp最大执行深度
 max-specpdl-size 10000                 ;最大容量
 eval-expression-print-length nil       ;设置执行表达式的长度没有限制
 eval-expression-print-level nil        ;设置执行表达式的深度没有限制
 )

;;--------------------rails-project--------------------
(autoload 'slim-mode "slim-mode" nil t)

;; helper-function
;; (defun is-rails-project ()
;;   (when (textmate-project-root)
;;     (file-exists-p (expand-file-name "config/environment.rb" (textmate-project-root)))))

;; (defun run-rails-test-or-ruby-buffer ()
;;   (interactive)
;;   (if (is-rails-project)
;;       (let* ((path (buffer-file-name))
;;              (filename (file-name-nondirectory path))
;;              (test-path (expand-file-name "test" (textmate-project-root)))
;;              (command (list ruby-compilation-executable "-I" test-path path)))
;;         (pop-to-buffer (ruby-compilation-do filename command)))
;;     (ruby-compilation-this-buffer)))

;;--------------------auctex--------------------
(autoload 'latex-mode "tex-site" nil t)

(eval-after-load "tex-site"
  '(progn
    (setq
     TeX-auto-save t
     ;; TeX-parse-self t
     )
    (setq-default
     TeX-engine 'xelatex
     ;; TeX-master nil
     )
    ;; (add-hook 'LaTeX-mode-hook 'LaTeX-install-toolbar)
    ;; (add-hook 'LaTeX-mode-hook 'turn-on-auto-fill)
    (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
    (add-hook 'LaTeX-mode-hook 'tex-pdf-mode)
    ))
