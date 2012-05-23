(add-to-el-get-sources
 '(:name diredful
         :type git
         :url "git://github.com/emacsmirror/diredful.git"
         :after (lambda ()
                  (setq diredful-init-file (expand-file-name "diredful-conf.el" (file-name-directory file)))))
 '(:name dired-details
         :type git
         :url "git://github.com/emacsmirror/dired-details.git"
         :after (lambda ()
                  (setq dired-omit-files "^\\...+$")))
 '(:name dired-details-plus
         :type git
         :url "git://github.com/emacsmirror/dired-details-plus.git"))

(eval-after-init
 '(progn
    (require 'dired-details+)
    (require 'diredful)
    ;; (define-key dired-mode-map "(" 'dired-details-hide)
    ;; (define-key dired-mode-map ")" 'dired-details-show)
    (add-hook 'dired-mode-hook
              '(lambda ()
                 (dired-omit-mode 1)))))

(provide 'set-dired)
