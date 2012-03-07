;;====================Buffer====================
;;----------dired----------
(add-hook 'dired-mode-hook
          (lambda ()
            (require 'diredful)
            ))

;;----------ibuffer----------
(global-set-key (kbd "C-x C-b") 'ibuffer)
;; (add-to-list 'ibuffer-never-show-regexps "^\\*")
(setq ibuffer-saved-filter-groups
      (quote (
              ("default"
               ("twitter" (or
                           (name . ":home")
                           (name . ":mentions")
                           (name . ":replies")
                           (name . ":friends")
                           (mode . twittering-mode)
                           ))
               ("irc" (or
                       (mode . rcirc-mode)
                       ))
               ("dired" (mode . dired-mode))
               ("planner" (or
                           (name . "^\\*Calendar\\*$")
                           (name . "^diary$")
                           (mode . muse-mode)
                           (mode . org-mode)
                           ))
               ("gnus" (or
                        (mode . message-mode)
                        (mode . bbdb-mode)
                        (mode . mail-mode)
                        (mode . gnus-group-mode)
                        (mode . gnus-summary-mode)
                        (mode . gnus-article-mode)
                        (name . "^\\.bbdb$")
                        (name . "^\\.newsrc-dribble")
                        ))
               ("emacs" (or
                         (name . "^\\*scratch\\*$")
                         (name . "^\\*Messages\\*$")
                         (name . "^\\*Warnings\\*$")
                         (name . "^\\*Completions\\*$")
                         (name . "^\\*.*\\*$")
                         ))
               (".emacs-settings" (mode . emacs-lisp-mode))
               )

              ("work"
               ("dired" (mode . dired-mode))
               ("ruby" (mode . ruby-mode))
               ("shell" (mode . shell-mode))
               )
              )))
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
(when (system-type-darwin-p)
  (global-set-key (kbd "s-o") `dired)
  (global-set-key (kbd "s-b") `ibuffer)
  (global-set-key (kbd "s-w") 'kill-this-buffer)
  (global-set-key (kbd "s-q") 'delete-frame)
  )
