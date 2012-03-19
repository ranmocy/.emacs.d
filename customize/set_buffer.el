;;====================Buffer====================
;;----------dired----------
(setq dired-omit-files "^\\...+$")                     ;hide hidden files
(add-hook 'dired-mode-hook
          (lambda ()
            (require 'diredful)
            (dired-omit-mode 1)
            ))

;;----------ibuffer----------
(global-set-key (kbd "C-x C-b") 'ibuffer)
;; (add-to-list 'ibuffer-never-show-regexps "^\\*")
(load (concat custom-path "/set_buffer_filters"))
(setq ibuffer-saved-filter-groups
      '(
        ("default"
         ("dired" (mode . dired-mode))
         (".emacs-settings" (mode . emacs-lisp-mode))
         )

        ("work"
         ("dired" (mode . dired-mode))
         ("ruby" (mode . ruby-mode))
         ("shell" (mode . shell-mode))
         )
        ))
(add-hook 'ibuffer-mode-hook
          (lambda ()
            (ibuffer-switch-to-saved-filter-groups "default")))

(windmove-default-keybindings (kbd "ESC"))
(global-set-key (kbd "C-z C-b") 'windmove-left)
(global-set-key (kbd "C-z C-f") 'windmove-right)
(global-set-key (kbd "C-z C-p") 'windmove-up)
(global-set-key (kbd "C-z C-n") 'windmove-down)

(setq
 uniquify-buffer-name-style 'forward ;当有两个文件名相同的缓冲时，使用前缀的目录名做 buffer 名字，不用原来的 foobar<?> 形式。
 auto-revert-mode t                  ;自动更新buffer
 history-delete-duplicates t        ;删除minibuffer的重复历史
 )

;;----------tabbar----------
(load "~/.emacs.d/plugins/tabbar/tabbar")
(tabbar-mode t)
(global-set-key (kbd "s-[") 'tabbar-backward-tab)
(global-set-key (kbd "s-]") 'tabbar-forward-tab)
(global-set-key (kbd "s-{") 'tabbar-backward-group)
(global-set-key (kbd "s-}") 'tabbar-forward-group)
(setq tabbar-help-on-tab-function nil)

;;----------kill-buffer----------
(global-set-key [C-tab] 'other-window)
(when (system-type-linux-p)
  (global-set-key [C-escape] 'kill-this-buffer)
  )
(when (not (system-type-windows-p))
  (global-set-key (kbd "s-o") `dired)
  (global-set-key (kbd "s-b") `ibuffer)
  (global-set-key (kbd "s-w") 'kill-this-buffer)
  (global-set-key (kbd "s-q") 'delete-frame)
  )
