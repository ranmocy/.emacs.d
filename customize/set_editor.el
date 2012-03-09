;;====================Editor====================
(setq
 kill-ring-max 1024          ;用一个很大的kill ring这样防止不小心删掉重要的东西
 undo-outer-limit 5000000     ;撤销限制
 mark-ring-max 1024           ;设置的mark ring容量
 global-mark-ring-max 1024    ;设置最大的全局标记容量
 ediff-window-setup-function (quote ediff-setup-windows-plain) ;设置窗口设置在同一个frame里
 kill-whole-line t
 x-select-enable-clipboard t            ;支持emacs和外部程序的粘贴
 default-fill-column 80                 ;默认显示 80列就换行
 )
;;(pc-selection-mode)

;;--------------------ispell--------------------
(if (system-type-darwin-p)
    (setq ispell-program-name "/usr/local/bin/aspell")
  (if (system-type-linux-p)
      (setq ispell-program-name "/usr/bin/aspell")))

;;----------字符搜索----------
(defun search-and-go-to-char (n char)
  "Move forward to Nth occurence of CHAR.
 Typing `wy-go-to-char-key' again will move forwad to the next Nth
 occurence of CHAR."
  (interactive "p\ncGo to char: ")
  (search-forward (string char) nil nil n)
  (while (char-equal (read-char) char)
    (search-forward (string char) nil nil n))
  (setq unread-command-events (list last-input-event)))
(global-set-key (kbd "C-` C-s") 'search-and-go-to-char)

;;----------ibus----------
(require 'ibus)
(global-set-key (kbd "C-\\") 'ibus-toggle)
(add-hook 'after-init-hook 'ibus-mode-on)
(add-hook 'after-make-frame-functions
          (lambda (new-frame)
            (select-frame new-frame)
            (or ibus-mode (ibus-mode-on))))
(custom-set-variables '(ibus-python-shell-command-name "python2"))
