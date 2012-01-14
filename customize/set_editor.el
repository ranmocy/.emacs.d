;;==================================================编辑==================================================
(setq kill-ring-max 1024)               ;用一个很大的kill ring这样防止不小心删掉重要的东西
(setq undo-outer-limit 5000000)         ;撤销限制
(setq mark-ring-max 1024)               ;设置的mark ring容量
(setq global-mark-ring-max 1024)        ;设置最大的全局标记容量
(setq ediff-window-setup-function (quote ediff-setup-windows-plain)) ;设置窗口设置在同一个frame里
(setq kill-whole-line t)

;;----------用shift+方向键进行选择----------
;;(pc-selection-mode)
(setq x-select-enable-clipboard t);支持emacs和外部程序的粘贴
(setq default-fill-column 80);默认显示 80列就换行

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
(global-set-key (kbd "C-c C-c C-s") 'search-and-go-to-char)


