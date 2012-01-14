;;==================================================外观==================================================
;;----------鼠标----------
;; (mouse-avoidance-mode 'cat-and-mouse)   ;鼠标闪避exile banish animnate
;; (setq mouse-yank-at-point t)            ;粘贴于光标处,而不是鼠标指针处

;;----------界面设置----------
(menu-bar-mode '-1)
(when (current-env-p 'gui)
  (tool-bar-mode '-1)
  (scroll-bar-mode '-1)
  ;; (set-face-attribute 'mode-line nil :box nil :height 100)
  )

;;----------光标----------
(when (current-env-p 'gui)
  (blink-cursor-mode '-1)                  ;指针不闪动
  (setq x-stretch-cursor t)               ;光标在 TAB 字符上会显示为一个大方块
  )

;;----------初始画面------------
(setq inhibit-startup-message t)        ;关闭起动时闪屏
(setq initial-scratch-message nil)      ;禁止在草稿缓存里面显示处始化信息

;;----------颜色主题----------
(if (current-env-p 'term)
    (load-theme 'tango)
  (load-theme 'tango-dark)
  (set-frame-font "YaHeiMono-16")
  (when (current-os-p 'macos)
    (global-set-key (kbd "s-\\") 'ns-toggle-fullscreen)
    (ns-toggle-fullscreen)
    )
)

;; (setq load-path (cons "~/.emacs.d/themes" load-path))
;; (require 'color-theme)
;; (require 'color-theme-darkmate)
;; (color-theme-darkmate)
;; (color-theme-initialize)
;; (color-theme-gray30)
;; (set-frame-font "YaHeiMono")
;;(load-theme 'tango)
;;
;; (defun set-win-color-theme(frame)
;;   (select-frame frame)  ;; must be current for local ctheme
;;   (if (window-system frame)  ;; test winsystem
;;       (load-theme 'tango-dark)
;;     )
;;   )
;; (add-hook 'after-make-frame-functions 'set-win-color-theme)
;; (set-win-color-theme (selected-frame))


;;----------状态栏----------
(column-number-mode t)
(display-battery-mode t)
(size-indication-mode t)
;; (which-function-mode)                 ;在状态条上显示当前光标在哪个函数体内部

;;----------显示时间----------
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(display-time-mode t)
