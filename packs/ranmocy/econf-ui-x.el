;;----------font-setting----------
;; "Luxi Mono-16" "YaHeiMono-16" "Inconsolata-18" "DejaVu Sans Mono-16"
;; "文泉驿等宽微米黑-16" "YaHei_Consolas-16"
(set-as-system-type 'frame-font-name :darwin "YaHeiMono-14" :linux "文泉驿等宽正黑-14")

;;----------fullscreen----------
(defun gtk-toggle-fullscreen ()
  (interactive)
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   '(2 "_NET_WM_STATE_FULLSCREEN" 0))
  )
(set-as-system-type 'fullscreen-function-name :darwin 'ns-toggle-fullscreen :linux 'gtk-toggle-fullscreen)

;;----------set-frame----------
(defun set-frame (frame)
  (when (window-system-p :gui)
    (with-selected-frame frame
      ;; (set-frame-font "YaHei Consolas Hybrid")
      (set-frame-font "Mono:pixelsize=16")
      (set-fontset-font "fontset-default" 'chinese-gbk "YaheiMono:pixelsize=20")
      ;; (set-fontset-font "fontset-default" 'unicode'("YaheiMono:pixelsize=20"))
      ;; iiiiiiii
      ;; aaaaaaaa
      ;; 中文测试

      (if (system-type-p :darwin)
          (menu-bar-mode)
        (menu-bar-mode '-1))
      (when (window-system-p :gui)
        ;;----------remove-bar----------
        (tool-bar-mode '-1)
        (scroll-bar-mode '-1)
        ;; (set-face-attribute 'mode-line nil :box nil :height 140)

        ;;----------cursor----------
        (blink-cursor-mode '-1)        ;指针不闪动
        (setq x-stretch-cursor t)      ;光标在 TAB 字符上会显示为一个大方块
        ;; (set-cursor-color "LightBlue") ;カーソルの色を設定----------

        ;;----------背景を透過させる----------
        (set-frame-parameter nil 'alpha '(100 90))

        ;;----------fullscreen----------
        (global-set-key (kbd "s-\\") fullscreen-function-name)
        (funcall fullscreen-function-name)
        )
      )))

;;----------Add-Hook----------
(load-theme 'zenburn)
;; (load-theme 'Amelie)
(add-hook 'after-make-frame-functions 'set-frame)
(unless (eq nil (selected-frame))
  (set-frame (selected-frame)))
(provide 'econf-ui-x)
