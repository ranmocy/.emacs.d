; set ibuffer as default
(global-set-key (kbd "C-x C-b") 'ibuffer)
;; (windmove-default-keybindings (kbd "ESC"))
(global-set-key (kbd "C-z C-b") 'windmove-left)
(global-set-key (kbd "C-z C-f") 'windmove-right)
(global-set-key (kbd "C-z C-p") 'windmove-up)
(global-set-key (kbd "C-z C-n") 'windmove-down)

(setq auto-revert-mode t)               ;自动更新buffer
(setq history-delete-duplicates t)      ;删除minibuffer的重复历史
(setq uniquify-buffer-name-style 'forward) ;; 当有两个文件名相同的缓冲时，使用前缀的目录名做 buffer 名字，不用原来的 foobar<?> 形式。

(push "~/.emacs.d/plugins/tabbar" load-path)
(require 'tabbar)
(tabbar-mode t)
(global-set-key (kbd "s-[") 'tabbar-backward-tab)
(global-set-key (kbd "s-]") 'tabbar-forward-tab)
(global-set-key (kbd "s-{") 'tabbar-backward-group)
(global-set-key (kbd "s-}") 'tabbar-forward-group)
(setq tabbar-help-on-tab-function nil)	; don't show the anoying help info when cursor over tab
(pop load-path)

(global-set-key [C-tab] 'other-window)
(global-set-key [C-escape] 'kill-this-buffer)

(when (current-os-p `macos)
      (global-set-key (kbd "s-w") 'kill-this-buffer)
      (global-set-key (kbd "s-b") `ibuffer)
      )
