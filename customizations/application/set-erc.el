;; 可以使用正则表达式
(setq erc-autojoin-channels-alist
      '(
        ("freenode.net" "#ubuntu-cn")
        ))
(defun erc-login ()
  (interactive)
  (erc :server "irc.freenode.net" :port 6667 :nick "ranmocy" :password irc-password)
  )

(provide 'set-erc)
