;;====================X====================
;;----------判断frame----------
(defun set-frame (frame)
  (with-selected-frame frame
    (load-theme 'tango-dark)
    ;;----------font-setting----------
    ;; (set-frame-font "DejaVu Sans Mono-16")
    ;; (set-frame-font "Inconsolata-18")
    ;;文泉驿等宽正黑-16
    ;;文泉驿等宽微米黑-20
    ;;YaHeiMono-18
    (set-frame-font "YaHei Consolas Hybrid-16")

    ;;----------fullscreen----------
    (when (system-type-linux-p)
      (defun my-fullscreen ()
        (interactive)
        (x-send-client-message
         nil 0 nil "_NET_WM_STATE" 32
         '(2 "_NET_WM_STATE_FULLSCREEN" 0))
        )
      (my-fullscreen)
      )
    (when (system-type-darwin-p)
      (global-set-key (kbd "s-\\") 'ns-toggle-fullscreen)
      (ns-toggle-fullscreen))
    ))

;;----------Add-Hook----------
(when (window-system-gui-p) 
  (if (and (fboundp 'daemonp) (daemonp))
      (add-hook 'after-make-frame-functions 'set-frame))
  (set-frame (selected-frame)))
