(add-to-el-get-sources
 '(:name sass-mode
         :type elpa
         :load "sass-mode.el"
         :after (lambda () (sass-mode-hook))))

(defun sass-mode-hook ()
  (autoload 'sass-mode "sass-mode" nil t)
  (add-to-list 'auto-mode-alist '("\.scss$" . sass-mode))
  (add-to-list 'auto-mode-alist '("\.sass$" . sass-mode)))

(provide 'set-sass-mode)
