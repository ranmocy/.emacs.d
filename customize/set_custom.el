;;----------Personal----------
(setq
 user-full-name "Ranmocy Sheng"
 user-mail-address "Ranmocy@gmail.com"
 )

;;----------Shortcut----------
(define-prefix-command 'run-map)
(global-set-key (kbd "C-`") 'run-map)
(define-key 'run-map (kbd "d") 'dired)
(define-key 'run-map (kbd "s") 'eshell)
(define-key 'run-map (kbd "t") 'todo-show)
(define-key 'run-map (kbd "c") 'calendar)
(define-key 'run-map (kbd "r") 'remember)

;;----------General----------
(fset 'yes-or-no-p 'y-or-n-p)           ;以 y/n代表 yes/no
(setq confirm-kill-emacs 'yes-or-no-p)  ;yes before kill emacs
;;(auto-compression-mode 1)               ;打开压缩文件时自动解压缩
(ido-mode 't)                           ;匹配选择模式
(setq ring-bell-function 'ignore)       ;关闭烦人的出错时的提示声
(setq message-log-max t)                ;设置message记录全部消息, 而不用截去
(setq suggest-key-bindings 1)           ;当使用 M-x COMMAND 后，过 1 秒钟显示该 COMMAND 绑定的键
(setq x-select-enable-clipboard t)      ;支持emacs和外部程序的粘贴

;;----------Apple-Keyboard-Remap----------
(when (system-type-darwin-p)
  (setq mac-command-modifier 'super)
  (setq mac-option-modifier 'meta)
  (setq mac-control-modifier 'control)
  (setq mac-function-modifier 'super)
  (setq mac-right-option-modifier nil)

  (setq mac-allow-anti-aliasing t)
  )

;;----------Enable-Functions----------
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
