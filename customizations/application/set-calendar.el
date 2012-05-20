;;--------------------Calendar--------------------
(setq
 calendar-remove-frame-by-deleting t              ;关闭日历
 calendar-week-start-day 1                        ;每周第一天是周一
 mark-diary-entries-in-calendar t                 ;标记有记录的日子
 mark-holidays-in-calendar nil                    ;标记节假日
 calendar-date-style 'iso                         ;日期格式种类
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

 diary-file "~/.emacs.d/.diary"
 )

(provide 'set-calendar)
