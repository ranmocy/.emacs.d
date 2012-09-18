(add-to-el-get-sources
 '(:name edit-server
         :type git
         :url "git://github.com/stsquad/emacs_chrome.git"
         :load "servers/edit-server.el"))

;; start edit-server
(eval-after-init 
 '(progn
    (if (not (locate-library "servers/edit-server"))
        (message "[Warning]edit-server will not be launched.")
      (require 'edit-server)
      ;; (unless (daemonp)
      ;;   (setq edit-server-new-frame nil)
      ;;   )
      (edit-server-start))))

(provide 'econf-application-edit-server)
