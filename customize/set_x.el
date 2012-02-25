;;====================X====================
;;----------判断frame----------
(defun set-frame (frame)
  (with-selected-frame frame
    (load-theme 'tango-dark)
    ;;----------字体设置----------
    ;; (set-frame-font "DejaVu Sans Mono-16")
    (set-frame-font "Inconsolata-18")
    ;;文泉驿等宽微米黑-20 ;;文泉驿等宽正黑-16
    ;;YaHeiMono-18 ;;YaHei Consolas Hybrid-16
    ;;DejaVu Sans YuanTi Mono-16

    ;;----------全屏设置----------
    (when (current-os-p 'linux)
      (defun my-fullscreen ()
        (interactive)
        (x-send-client-message
         nil 0 nil "_NET_WM_STATE" 32
         '(2 "_NET_WM_STATE_FULLSCREEN" 0))
        )
      (my-fullscreen)
      )
    (when (current-os-p 'macos)
      (global-set-key (kbd "s-\\") 'ns-toggle-fullscreen)
      (ns-toggle-fullscreen))
    ))

;;----------Add-Hook----------
(when (and (fboundp 'daemonp) (daemonp))
  (add-hook 'after-make-frame-functions 'set-frame)
  )
(set-frame (selected-frame))
