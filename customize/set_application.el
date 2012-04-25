;;--------------------Shortcut--------------------
(define-key 'run-map (kbd "c") 'calendar)
(define-key 'run-map (kbd "t") 'todo-show)

;;--------------------Calendar--------------------
(setq
 calendar-remove-frame-by-deleting t              ;关闭日历
 calendar-week-start-day 1                        ;每周第一天是周一
 mark-diary-entries-in-calendar t                 ;标记有记录的日子
 mark-holidays-in-calendar nil                    ;标记节假日
 calendar-date-style 'iso                         ;日期格式种类
 diary-file "~/.emacs.d/diary"                    ;日记文件
 appt-issue-message t                             ;弹窗约会提醒

 ;; 中文天干地支 from smth 在 calendar 中按 p C 就可以看到中文的天干地支了
 chinese-calendar-celestial-stem ["甲" "乙" "丙" "丁" "戊" "己" "庚" "辛" "壬" "癸"]
 chinese-calendar-terrestrial-branch ["子" "丑" "寅" "卯" "辰" "巳" "午" "未" "申" "酉" "戌" "亥"]

 ;;查看日出日落时间，设置所在地的经纬度和地名，calendar 中按 S，可以根据这些信息告知你每天的日出和日落的时间：
 ;;calendar-location-name "Dalian"
 ;;calendar-latitude +38.90
 ;;calendar-longitude +121.58
 calendar-location-name "Shanghai"
 calendar-latitude +31.024994
 calendar-longitude +121.431607
 )

;;--------------------Todo--------------------
(setq
 todo-file-do "~/.emacs.d/todo/todo-do"
 todo-file-done "~/.emacs.d/todo/todo-done"
 todo-file-top "~/.emacs.d/todo/todo-top"
 )

;;--------------------Bookmark--------------------
(setq
 bc-bookmark-file "~/.emacs.d/bookmark" ;设置书签的保存位置
 bc-bookmark-limit 300                  ;设置书签的最大数量
 bookmark-save-flag 1
 )

;;--------------------Twitter--------------------
(add-to-list 'load-path (concat plugin-path "twittering-mode"))
(autoload 'twittering-mode "twittering-mode" nil t)
;;(require 'twittering-mode)
(setq twittering-use-master-password t)
(setq twittering-icon-mode t)           ; Show icons
(setq twittering-timer-interval 30)     ; Update your timeline each 30 seconds
(setq twittering-url-show-status nil) ; Keeps the echo area from showing all the http processes
(add-hook 'twittering-edit-mode-hook
          (lambda () (ispell-minor-mode) (flyspell-mode)))

(setq twittering-proxy-use t)
(setq twittering-proxy-server "127.0.0.1")
(setq twittering-proxy-port 8087)
;; (setq twittering-proxy-user "username")
;; (setq twittering-proxy-password "password")

(setq twittering-initial-timeline-spec-string
      '(":home"
        ":replies"
        ;; ":mentions"
        ;; "ranmocy"
        ;; ":favorites"
        ;; ":direct_messages"
        ;; ":search/emacs/"
        ;; "user_name/list_name"
        ))
(add-hook 'twittering-mode-hook
          (lambda ()
            (mapc (lambda (pair)
                    (let ((key (car pair))
                          (func (cdr pair)))
                      (define-key twittering-mode-map
                        (read-kbd-macro key) func)))
                  '(
                    ("F" . twittering-friends-timeline)
                    ("R" . twittering-replies-timeline)
                    ("U" . twittering-user-timeline)
                    ("T" . twittering-native-retweet)
                    ("." . twittering-toggle-reverse-mode)
                    ;; ("W" . twittering-update-status-interactive)
                    ))))
(when (system-type-linux-p)
  (add-hook 'twittering-new-tweets-hook
            (lambda ()
              (let ((n twittering-new-tweets-count))
                (start-process "twittering-notify" nil "notify-send"
                               "-i" "/usr/share/pixmaps/gnome-emacs.png"
                               "New tweets"
                               (format "You have %d new tweet%s"
                                       n (if (> n 1) "s" "")))))))

;;--------------------IRC--------------------
;;----------erc----------
;;可以使用正则表达式
(setq erc-autojoin-channels-alist
      '(
        ("freenode.net" "#ubuntu-cn")
        ))
(defun erc-login ()
  (interactive)
  (erc :server "irc.freenode.net" :port 6667 :nick "ranmocy" :password irc-password)
  )

;;----------rcirc----------
(setq rcirc-auto-authenticate-flag t)
(setq rcirc-authinfo '(("freenode" nickserv "ranmocy" irc-password)))

(setq rcirc-startup-channels-alist
      '(("irc.freenode.net" :channels ("#ubuntu-cn"))))
(setq rcirc-server-alist
      `(("irc.freenode.net" :channels ("#ubuntu-cn"))))
