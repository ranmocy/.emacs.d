(require 'set-auto-save)
(require 'set-auto-backup)
(require 'set-mac-modifier)
;; (require 'set-evil)
(require 'set-ibus)
(require 'set-ispell)
(require 'set-search)

(setq
 kill-ring-max 1024          ;用一个很大的kill ring这样防止不小心删掉重要的东西
 undo-outer-limit 5000000     ;撤销限制
 mark-ring-max 1024           ;设置的mark ring容量
 global-mark-ring-max 1024    ;设置最大的全局标记容量
 ediff-window-setup-function (quote ediff-setup-windows-plain) ;设置窗口设置在同一个frame里
 kill-whole-line t
 x-select-enable-clipboard t            ;支持emacs和外部程序的粘贴
 default-fill-column 80                 ;默认显示 80列就换行
 )
;; (pc-selection-mode)
;; (set-input-method 'chinese-py)
;; (toggle-input-method)

(ido-mode 't)                           ; 匹配选择模式
(fset 'yes-or-no-p 'y-or-n-p)           ; 以 y/n代表 yes/no
;; (auto-compression-mode 1)               ;打开压缩文件时自动解压缩
(setq
 confirm-kill-emacs 'yes-or-no-p        ; yes before kill emacs
 ring-bell-function 'ignore             ; 关闭烦人的出错时的提示声
 message-log-max t                      ; 设置message记录全部消息, 而不用截去
 suggest-key-bindings 1                 ; 当使用 M-x COMMAND 后，过 1 秒钟显示该 COMMAND 绑定的键
 x-select-enable-clipboard t            ; 支持emacs和外部程序的粘贴
 )

(provide 'set-editor)
