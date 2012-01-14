;;====================X====================
;;----------判断frame----------
(if (and (fboundp 'daemonp) (daemonp))
    (add-hook 'after-make-frame-functions 
              (lambda (frame) 
                (with-selected-frame frame
                  ;;----------字体设置----------
                                        ;		  (set-frame-font "Hiragino Sans GB W3-16")
                  (set-frame-font "YaHeiMono-16")
                  ;;文泉驿等宽微米黑-20 ;;文泉驿等宽正黑-16
                  ;;YaHeiMono-18 ;;YaHei Consolas Hybrid-16
                  ;;DejaVu Sans YuanTi Mono-16

                  ;;----------全屏设置----------
                  (if (equalp current-os `linux)
                      (defun my-fullscreen ()
                        (interactive)
                        (x-send-client-message
                         nil 0 nil "_NET_WM_STATE" 32
                         '(2 "_NET_WM_STATE_FULLSCREEN" 0))
                        )
                    (my-fullscreen)
                    )
                  ))))
