;;----------个人信息----------
(setq user-full-name "Ranmocy Sheng")
(setq user-mail-address "Ranmocy@gmail.com")

;;----------备份文件----------
(setq make-backup-files nil)
(setq auto-save-default nil)
;; (setq version-control t);;启用版本控制，即可以备份多次
;; (setq kept-old-versions 2);;备份最原始的版本两次，及第一次编辑前的文档，和第二次编辑前的文档
;; (setq kept-new-versions 2);;备份最新的版本1次，理解同上
;; (setq delete-old-versions t);;删掉不属于以上3中版本的版本
;; (setq backup-directory-alist '(("." . "~/.emacs.d/backups")));;设置备份文件的路径
;; (setq backup-by-copying t);;备份设置方法，直接拷贝

;;----------快捷启动----------
(define-prefix-command 'run-map)
(global-set-key (kbd "C-`") 'run-map)
(define-key 'run-map (kbd "d") 'dired)
(define-key 'run-map (kbd "s") 'eshell)
(define-key 'run-map (kbd "t") 'todo-show)
(define-key 'run-map (kbd "c") 'calendar)
(define-key 'run-map (kbd "r") 'remember)

;;----------一般设置----------
(fset 'yes-or-no-p 'y-or-n-p)           ;以 y/n代表 yes/no
;;(auto-compression-mode 1)               ;打开压缩文件时自动解压缩
(ido-mode 't)                           ;匹配选择模式
(setq ring-bell-function 'ignore)       ;关闭烦人的出错时的提示声
(setq message-log-max t)                ;设置message记录全部消息, 而不用截去
(setq suggest-key-bindings 1)           ;当使用 M-x COMMAND 后，过 1 秒钟显示该 COMMAND 绑定的键
(setq x-select-enable-clipboard t)      ;支持emacs和外部程序的粘贴

;;-----Apple-keyboard-remap-----
(when (current-os-p 'macos)
  ;;  (setq mac-command-modifier 'super)
  (setq mac-option-modifier 'meta)
  (setq mac-control-modifier 'control)
  (setq mac-function-modifier 'super)

  ;;  (setq mac-right-option-modifier 'super)
  (setq mac-allow-anti-aliasing t)
  )
