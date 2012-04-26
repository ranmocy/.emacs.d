;;; set-auto-header.el
;; 自动添加文件头

(require 'auto-header)
(setq header-full-name "Ranmocy")               ; 设置文件头中的姓名
(setq header-email-address "ranmocy@gmail.com") ; 设置邮箱

;; 设置每次保存时要更新的项目
(setq header-update-on-save
      '(filename
        modified
        counter
        copyright))

;; 设置文件头的显示格式
(setq header-field-list
      '(filename                        ;文件名
        blank                           ;空行，下同
        copyright
        version
        author
        created
        blank
        description
        ;;blank
        ;;modified_by
        ;; blank
        ;;status
        ;;更新
        ;;blank
        ))

(provide 'set-auto-header)
