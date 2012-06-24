(add-to-el-get-sources
 '(:name diredful
         :type git
         :url "git://github.com/emacsmirror/diredful.git"
         :before (lambda ()
                   (setq diredful-init-file (expand-file-name "diredful-conf.el" (file-name-directory (locate-library "set-dired"))))))
 '(:name dired-details
         :type git
         :url "git://github.com/emacsmirror/dired-details.git"
         :before (lambda ()
                  (setq dired-omit-files "^\\...+$")))
 '(:name dired-details-plus
         :type git
         :url "git://github.com/emacsmirror/dired-details-plus.git"))

(eval-after-init
 '(progn
    (require 'dired-details+)
    ;; (define-key dired-mode-map "(" 'dired-details-hide)
    ;; (define-key dired-mode-map ")" 'dired-details-show)
    (require 'diredful)
    (add-hook 'dired-mode-hook
              '(lambda ()
                 (dired-omit-mode 1)))))

(provide 'set-dired)
