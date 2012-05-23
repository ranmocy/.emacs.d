;; `eval-after-init` is modified from https://github.com/technomancy/emacs-starter-kit/commit/5efa136c2ffced48fb5a25948e92ea11b850cedb

(defun eval-after-init (form)
  "Add `(lambda () FORM)' to `after-init-hook'. 
If Emacs has already finished initialization, also eval FORM immediately."
  (let ((func (list 'lambda nil form)))
    (add-hook 'after-init-hook func)
    (when after-init-time
      (eval form))))

(provide 'ext-elisp)
