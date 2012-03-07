;;====================UI====================
;;----------mouse----------
(mouse-avoidance-mode 'cat-and-mouse)   ;鼠标闪避exile banish animnate
(setq mouse-yank-at-point t)            ;粘贴于光标处,而不是鼠标指针处

;;----------lambda----------
(defun pretty-lambdas ()
  "Display the word “lambda” by “λ”."
  (font-lock-add-keywords
   nil
   `(("\(\\(\\<lambda\\>\\)"
      (0
       (progn
         (compose-region (match-beginning 1) (match-end 1) "λ")
         'font-lock-keyword-face))))))

(add-hook 'emacs-lisp-mode-hook 'pretty-lambdas)
;; (remove-hook 'emacs-lisp-mode-hook 'pretty-lambdas)
(defalias 'λ 'lambda)

;;----------startup------------
(setq
 inhibit-startup-message t        ;关闭起动时闪屏
 initial-scratch-message nil      ;禁止在草稿缓存里面显示处始化信息
 )

;;----------status-bar----------
(column-number-mode t)
(display-battery-mode t)
(size-indication-mode t)
;; (which-function-mode)                 ;在状态条上显示当前光标在哪个函数体内部
(display-time-mode t)
(setq
 display-time-24hr-format t
 display-time-day-and-date t
 )
