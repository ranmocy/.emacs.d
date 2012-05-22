(add-to-el-get-sources
 '(:name css-mode
         :type elpa
         :after (lambda () (css-mode-hook))))

(defun css-mode-hook ()
  (autoload 'css-mode "css-mode" nil t)
  (add-hook 'css-mode-hook '(lambda ()
                              (setq css-indent-level 2)
                              (setq css-indent-offset 2))))

(provide 'set-css-mode)
