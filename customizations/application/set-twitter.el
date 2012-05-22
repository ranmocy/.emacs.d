(add-to-el-get-sources
 '(:name twittering-mode
         :type git
         :url "git://github.com/hayamiz/twittering-mode.git"))

(autoload 'twittering-mode "twittering-mode" nil t)

(eval-after-load "twittering-mode"
  (progn
    (setq twittering-use-master-password t)
    (setq twittering-icon-mode t)        ; Show icons
    (setq twittering-timer-interval 30)  ; Update your timeline each 30 seconds
    (setq twittering-url-show-status nil) ; Keeps the echo area from showing all the http processes
    (add-hook 'twittering-edit-mode-hook
              (lambda () (ispell-minor-mode) (flyspell-mode)))

    (setq twittering-proxy-use t)
    (setq twittering-proxy-server "127.0.0.1")
    (setq twittering-proxy-port 8087)
    ;; (setq twittering-proxy-user "username")
    ;; (setq twittering-proxy-password "password")

    (setq twittering-initial-timeline-spec-string
          '(":home"
            ":mentions"
            ;; ":replies"
            ;; "ranmocy"
            ;; ":favorites"
            ;; ":direct_messages"
            ;; ":search/emacs/"
            ;; "user_name/list_name"
            ))
    (add-hook 'twittering-mode-hook
              (lambda ()
                (mapc (lambda (pair)
                        (let ((key (car pair))
                              (func (cdr pair)))
                          (define-key twittering-mode-map
                            (read-kbd-macro key) func)))
                      '(
                        ("F" . twittering-friends-timeline)
                        ("R" . twittering-replies-timeline)
                        ("U" . twittering-user-timeline)
                        ("T" . twittering-native-retweet)
                        ("." . twittering-toggle-reverse-mode)
                        ;; ("W" . twittering-update-status-interactive)
                        ))))
    (when (system-type-linux-p)
      (add-hook 'twittering-new-tweets-hook
                (lambda ()
                  (let ((n twittering-new-tweets-count))
                    (start-process "twittering-notify" nil "notify-send"
                                   "-i" "/usr/share/pixmaps/gnome-emacs.png"
                                   "New tweets"
                                   (format "You have %d new tweet%s"
                                           n (if (> n 1) "s" "")))))))
    )  )
(provide 'set-twitter)

;;; set-twitter.el ends here
