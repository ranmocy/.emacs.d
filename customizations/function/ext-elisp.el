;; `eval-after-init` is modified from https://github.com/technomancy/emacs-starter-kit/commit/5efa136c2ffced48fb5a25948e92ea11b850cedb

(defun eval-after-init (form)
  "Add `(lambda () FORM)' to `after-init-hook'. 
If Emacs has already finished initialization, also eval FORM immediately."
  (let ((func (list 'lambda nil form)))
    (add-hook 'after-init-hook func)
    (when after-init-time
      (eval form))))

(defun set-if (func-name name &rest args)
  "`args' is a plist contained the conditions and values.
The function take out every pair of args to run `func-name' function with `condition'.
If returns t, set `name' to the `value'.
The function return the value of last matched or nil."
  (let ((spec args) (ans nil))
    (while spec
      (if (funcall func-name (car spec))
          (progn
            (setq ans (cadr spec))
            (set name (cadr spec))))
      (setq spec (cddr spec)))
    ans))

(defun funcall-if (func-name &rest args)
  "`args' is a plist contained the conditions and values.
The function take out every pair of args to run `func-name' function with `condition'.
If returns t, funcall the function called `value'.
The function return the result of last matched or nil."
  (cond
   ((null args) nil)
   ((funcall func-name (car args)) (funcall (cadr args)))
   (t (eval `(funcall-if ',func-name ,@(cddr args)))))
  )

(provide 'ext-elisp)
