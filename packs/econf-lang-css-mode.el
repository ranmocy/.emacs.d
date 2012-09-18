(add-to-el-get-sources
 '(:name css-mode
         :type elpa
         :after (lambda ()
                  (autoload 'css-mode "css-mode" nil t))))

(eval-after-load "css-mode"
  (progn
    (add-hook 'css-mode-hook
              '(lambda ()
                 (setq css-indent-level 2)
                 (setq css-indent-offset 2)))))

(provide 'econf-lang-css-mode)
