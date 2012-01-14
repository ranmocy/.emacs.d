;;==================================================日历==================================================
(setq calendar-remove-frame-by-deleting t)              ;关闭日历
(setq calendar-week-start-day 1)                        ;每周第一天是周一
(setq mark-diary-entries-in-calendar t)                 ;标记有记录的日子
(setq mark-holidays-in-calendar nil)                    ;标记节假日
(setq calendar-date-style (quote iso))                  ;日期格式种类
(setq diary-file "~/.emacs.d/.diary")                   ;日记文件
(setq appt-issue-message t)                             ;弹窗约会提醒

;; 中文天干地支 from smth 在 calendar 中按 p C 就可以看到中文的天干地支了
(setq chinese-calendar-celestial-stem ["甲" "乙" "丙" "丁" "戊" "己" "庚" "辛" "壬" "癸"])
(setq chinese-calendar-terrestrial-branch ["子" "丑" "寅" "卯" "辰" "巳" "午" "未" "申" "酉" "戌" "亥"])

;;查看日出日落时间
;;设置所在地的经纬度和地名，calendar 中按 S，可以根据这些信息告知你每天的日出和日落的时间：
;;(setq calendar-location-name "Dalian")
;;  (setq calendar-latitude +38.90)
;;  (setq calendar-longitude +121.58)
(setq calendar-location-name "Shanghai")
(setq calendar-latitude +31.024994)
(setq calendar-longitude +121.431607)