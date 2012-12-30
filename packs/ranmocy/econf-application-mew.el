(add-to-el-get-sources
 '(:name emacs-w3m)
 '(:name mew
         :type git
         :url "git://github.com/kazu-yamamoto/Mew.git"
         :after (progn
                  (autoload 'mew "mew" nil t)
                  (autoload 'mew-send "mew" nil t))))

(eval-after-load "mew"
  '(progn
     (add-to-list 'exec-path (expand-file-name "el-get/mew/bin/" user-emacs-directory))
     (setq mew-icon-directory
           (expand-file-name "etc" (file-name-directory (locate-library "mew.el"))))
     (setq mew-use-cached-passwd t)

     ;; Optional setup (Read Mail menu):
     (if (boundp 'read-mail-command)
         (setq read-mail-command 'mew))

     ;; Optional setup (e.g. C-xm for sending a message):
     (autoload 'mew-user-agent-compose "mew" nil t)
     (if (boundp 'mail-user-agent)
         (setq mail-user-agent 'mew-user-agent))
     (if (fboundp 'define-mail-user-agent)
         (define-mail-user-agent
           'mew-user-agent
           'mew-user-agent-compose
           'mew-draft-send-message
           'mew-draft-kill
           'mew-send-hook))

     (setq mew-pop-size 0)
     (setq mew-smtp-auth-list nil)
     (setq toolbar-mail-reader 'Mew)
     (set-default 'mew-decode-quoted 't) 
     (when (boundp 'utf-translate-cjk)
       (setq utf-translate-cjk t)
       (custom-set-variables
        '(utf-translate-cjk t)))
     (if (fboundp 'utf-translate-cjk-mode)
         (utf-translate-cjk-mode 1))

     (defvar mew-cite-fields '("From:" "Subject:" "Date:"))
     (defvar mew-cite-format "From: %s\nSubject: %s\nDate: %s\n\n")
     (defvar mew-cite-prefix "> ")

     (setq mew-ssl-verify-level 0)
     (setq mew-use-cached-passwd t)

     (setq mew-signature-file "~/Mail/signature")
     (setq mew-signature-as-lastpart t)
     (setq mew-signature-insert-last t)
     (add-hook 'mew-before-cite-hook 'mew-header-goto-body)
     (add-hook 'mew-draft-mode-newdraft-hook 'mew-draft-insert-signature)

     ;; (setq mew-refile-guess-alist
     ;;       '(("To:"
     ;;          ("@octave.org"                       . "+math/octave")
     ;;          ("@freebsd.org"                      . "+unix/freebsd"))
     ;;         ("Cc:"
     ;;          ("@octave.org"                       . "+math/octave")
     ;;          ("@freebsd.org"                      . "+unix/freebsd"))
     ;;         (nil . "+inbox")))
     (setq mew-refile-guess-control
           '(mew-refile-guess-by-folder
             mew-refile-guess-by-alist))

     ;; Summary form
     (setq mew-summary-form
           '(type " " (5 date) " " (20 from) " " t (20 subj)))
     (setq mew-summary-form-extract-rule '(name " " addr))
     (setq mew-summary-reply-with-citation-position 'body) ; body or end

     ;; Spam
     (setq mew-summary-form-mark-spam t)

     ;; Password
     (setq mew-use-master-passwd t)

     ;;(setq mew-ssl-verify-level 0)
     (setq mew-prog-ssl "/usr/local/bin/stunnel")

     ;; HTML support
     (setq mew-mime-multipart-alternative-list '("Text/Html" "Text/Plain" "*."))
     (condition-case nil
         (require 'mew-w3m)
       (file-error nil))
     (setq mew-use-text/html t)

     (defcustom user-mail-username nil
       "Username for email"
       )

     ;; setup mail
     (setq mew-config-alist
           `(
             (default
               (mailbox-type          imap)
               (proto                 "%")
               (prog-ssl              "/usr/local/bin/stunnel")
               (imap-server           "imap.gmail.com")
               (imap-ssl-port         "993")
               (imap-user             ,user-mail-address)
               (name                  ,user-full-name)
               (user                  ,user-mail-username)
               (mail-domain           "gmail.com")
               (imap-ssl              t)
               (imap-size             0)
               (imap-delete           t)
               (imap-queue-folder     "%queue")
               (imap-trash-folder     "%Trash")
               ;; This must be in concile with your IMAP box setup
               (smtp-ssl              t)
               (smtp-auth-list        ("PLAIN" "LOGIN" "CRAM-MD5"))
               (smtp-user             ,user-mail-address)
               (smtp-server           "smtp.gmail.com")
               (smtp-ssl-port         "465")
               )))
     ))

(provide 'econf-application-mew)
;;; set-mew.el ends here
