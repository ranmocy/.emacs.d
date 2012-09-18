(setq
 kill-ring-max 1024           ;用一个很大的kill ring这样防止不小心删掉重要的东西
 undo-outer-limit 5000000     ;撤销限制
 mark-ring-max 1024           ;设置的mark ring容量
 global-mark-ring-max 1024    ;设置最大的全局标记容量
 ediff-window-setup-function (quote ediff-setup-windows-plain) ;设置窗口设置在同一个frame里
 kill-whole-line t                      ;删除整行
 x-select-enable-clipboard t            ;支持emacs和外部程序的粘贴
 default-fill-column 80                 ;默认显示 80列就换行
 )
;; (pc-selection-mode)
;; (set-input-method 'chinese-py)
;; (toggle-input-method)

(fset 'yes-or-no-p 'y-or-n-p)           ; 以 y/n代表 yes/no
;; (auto-compression-mode 1)               ;打开压缩文件时自动解压缩
(setq
 confirm-kill-emacs 'yes-or-no-p        ; yes before kill emacs
 ring-bell-function 'ignore             ; 关闭烦人的出错时的提示声
 message-log-max t                      ; 设置message记录全部消息, 而不用截去
 suggest-key-bindings 1                 ; 当使用 M-x COMMAND 后，过 1 秒钟显示该 COMMAND 绑定的键
 x-select-enable-clipboard t            ; 支持emacs和外部程序的粘贴
 )

(global-set-key (kbd "s-SPC") 'just-one-space)
(global-set-key (kbd "C-h") 'delete-backward-char)

;; whenever an external process changes a file underneath emacs, and there
;; was no unsaved changes in the corresponding buffer, just revert its
;; content to reflect what's on-disk.
(global-auto-revert-mode 1)

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


(provide 'econf-editor-editor-utils)
