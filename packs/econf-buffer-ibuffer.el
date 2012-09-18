(require 'econf-buffer-buffer-filter)

(global-set-key (kbd "C-x C-b") 'ibuffer)
;; (add-to-list 'ibuffer-never-show-regexps "^\\*")
(setq ibuffer-saved-filter-groups
      '(
        ("default"
         ("org"
          (mode . org-mode)
          )
         ("markdown"
          (mode . markdown-mode)
          )
         ("dired" (mode . dired-mode))
         (".emacs-settings" (mode . emacs-lisp-mode))
         ("messages"
          (name . "^\*.*\*$"))
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


(setq
 uniquify-buffer-name-style 'forward ;当有两个文件名相同的缓冲时，使用前缀的目录名做 buffer 名字，不用原来的 foobar<?> 形式。
 auto-revert-mode t                  ;自动更新buffer
 history-delete-duplicates t        ;删除minibuffer的重复历史
 )

(provide 'econf-buffer-ibuffer)
