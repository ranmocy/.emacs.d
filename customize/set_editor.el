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
;; (set-input-method 'chinese-py)
;; (toggle-input-method)

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
(when (system-type-linux-p)
  (require 'ibus)
  (global-set-key (kbd "C-\\") 'ibus-toggle)
  (ibus-define-common-key ?\C-\s nil)     ;Use C-SPC for Set Mark command
  (ibus-define-common-key ?\C-/ nil)      ;Use C-/ for Undo command
  (setq ibus-cursor-color '("yellow" "blue" "red")) ;Change cursor color depending on IBus status
  ;; Turn on ibus-mode automatically after loading .emacs
  (add-hook 'after-init-hook 'ibus-mode-on)
  (add-hook 'after-make-frame-functions
            (lambda (new-frame)
              (select-frame new-frame)
              (or ibus-mode (ibus-mode-on))))
  ;; Specific python2
  (custom-set-variables '(ibus-python-shell-command-name "python2"))
  )

;;----------evil----------
(eval-after-load "evil"
  '(progn
     (defun evil-undefine ()
       (interactive)
       (let (evil-mode-map-alist)
         (call-interactively (key-binding (this-command-keys)))))

     (define-key evil-normal-state-map "\C-r" 'isearch-backward)
     (define-key evil-normal-state-map "\C-e" 'end-of-line)
     (define-key evil-normal-state-map "\C-n" 'next-line)
     (define-key evil-normal-state-map "\C-p" 'previous-line)

     (define-key evil-insert-state-map "\C-k" 'evil-undefine)
     (define-key evil-insert-state-map "\C-r" 'evil-undefine)
     (define-key evil-insert-state-map "\C-e" 'evil-undefine)
     (define-key evil-insert-state-map "\C-n" 'evil-undefine)
     (define-key evil-insert-state-map "\C-p" 'evil-undefine)

     ;; viper-cua-region-fix
     ;; (define-key evil-normal-state-map [backspace] 'backward-delete-char-untabify)
     (define-key evil-insert-state-map [backspace] 'backward-delete-char-untabify)
     ;; (define-key viper-vi-global-user-map "\C-d" 'delete-char)
     ;; (define-key viper-insert-global-user-map "\C-d" 'delete-char)

     (setq evil-default-cursor '("LightBlue" box))
     ;; (setq evil-normal-state-cursor '("LightBlue" box))
     ;; (setq evil-insert-state-cursor '("LightBlue" box))
     ;; (setq evil-visual-state-cursor '("LightBlue" box))
     ;; (setq evil-motion-state-cursor '("LightBlue" box))
     ;; (setq evil-replace-state-cursor '("LightBlue" box))
     ;; (ksetq evil-operator-state-cursor '("LightBlue" box))
     (setq evil-emacs-state-cursor '("Red" box))
     ))
(add-to-list 'load-path "~/.emacs.d/plugins/evil")
(require 'evil)
(evil-mode 1)
