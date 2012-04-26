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

(provide 'set-language)
