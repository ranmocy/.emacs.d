(add-to-el-get-sources
 '(:name markdown-mode
         :load "markdown-mode.el"
         :after (lambda () (markdown-mode-hook))))

(defun markdown-mode-hook ()
  (autoload 'markdown-mode "markdown-mode.el" nil t)
  (add-to-list 'auto-mode-alist '("\\.\\(markdown\\|md\\|text\\)$" . markdown-mode))
  (define-key markdown-mode-map
    (kbd "<tab>")
    (lambda()
      (interactive)
      (let ((yas/fallback-behavior 'return-nil))
        (unless (yas/expand)
          (message "markdown-cycle should be called")
          (markdown-cycle))))))

(provide 'set-markdown-mode)
