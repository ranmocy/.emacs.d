(setq rcirc-auto-authenticate-flag t)
(setq rcirc-authinfo '(("freenode" nickserv "ranmocy" irc-password)))

(setq rcirc-startup-channels-alist
      '(("irc.freenode.net" :channels ("#ubuntu-cn"))))
(setq rcirc-server-alist
      `(("irc.freenode.net" :channels ("#ubuntu-cn"))))

(provide 'set-rcirc)
