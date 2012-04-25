;;====================X====================
;;----------判断frame----------
(defun set-frame (frame)
  (if (or (and (fboundp 'daemonp) (daemonp)) (window-system-gui-p))
      (with-selected-frame frame
        ;;----------font-setting----------
        (when (system-type-linux-p)
          (set-frame-font "文泉驿等宽正黑-14"))
        (when (system-type-darwin-p)
          (set-frame-font "YaHeiMono-16"))
        ;; (set-frame-font "DejaVu Sans Mono-16")
        ;; (set-frame-font "Inconsolata-16")
        ;; (set-frame-font "文泉驿等宽微米黑-12")
        ;; (set-frame-font "YaHeiMono-18")
        ;; (set-frame-font "YaHei_Consolas-16")

        (menu-bar-mode '-1)
        (when (window-system-gui-p)
          ;;----------remove-bar----------
          (tool-bar-mode '-1)
          (scroll-bar-mode '-1)
          ;; (set-face-attribute 'mode-line nil :box nil :height 100)

          ;;----------cursor----------
          (blink-cursor-mode '-1)        ;指针不闪动
          (setq x-stretch-cursor t)      ;光标在 TAB 字符上会显示为一个大方块
          (set-cursor-color "LightBlue") ;カーソルの色を設定----------

          ;;----------背景を透過させる----------
          (set-frame-parameter nil 'alpha '(95 80))
          (when (system-type-darwin-p)
            ;; マウス・スクロールを滑らかにする（Mac Emacs 専用）
            (setq mac-mouse-wheel-smooth-scroll t)
            )

          ;;----------fullscreen----------
          (when (system-type-linux-p)
            (defun gtk-toggle-fullscreen ()
              (interactive)
              (x-send-client-message
               nil 0 nil "_NET_WM_STATE" 32
               '(2 "_NET_WM_STATE_FULLSCREEN" 0))
              )
            (global-set-key (kbd "s-\\") 'gtk-toggle-fullscreen)
            ;; (linux-fullscreen)
            )
          (when (system-type-darwin-p)
            (global-set-key (kbd "s-\\") 'ns-toggle-fullscreen)
            (ns-toggle-fullscreen))
          )
        )))

;;----------Add-Hook----------
(load-theme 'tango-dark)
(add-hook 'after-make-frame-functions 'set-frame)
(unless (eq nil (selected-frame))
  (set-frame (selected-frame)))
