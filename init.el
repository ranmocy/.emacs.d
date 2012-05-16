;;; init.el
;; Ranmocy's Emacs Configurations -- A well-organized configurations.

;; Copyright (C) 2009, 2010, 2011, 2012
;; Author:   Ranmocy <Ranmocy@gmail.com>
;; Created:  someday in 2009
;; Updated:  2012-04-26
;; Version:  0.9.1-p0
;; Keywords: emacs, xemacs, macos, linux, nowindows
;; Github:  `https://github.com/ranmocy/emacs_config'
;; GitCafe: `http://gitcafe.com/ranmocy/emacs_config'

;; Every file here should be packaged to `provide' a feature and be `require' by others.
;; Basically it can adapt MacOS and any distribution of GNU/Linux.

;;----------Path----------
(add-to-list 'exec-path "/usr/local/bin")
(setq custom-load-path (expand-file-name "customizations/" user-emacs-directory)) ; customization files
(setq custom-file (expand-file-name "set-custom.el" custom-load-path)) ; Emacs default customization file
(setq plugin-load-path (expand-file-name "plugins/" user-emacs-directory)) ; Third-party packages path
(setq custom-theme-load-path (list (expand-file-name "themes/" user-emacs-directory) t)) ; t for Emacs 24 default themes

(normal-top-level-add-to-load-path (list user-emacs-directory))

;; add custom path and its subdirs to load-path
(let ((default-directory custom-load-path))
  (normal-top-level-add-to-load-path '("."))
  (normal-top-level-add-subdirs-to-load-path))

;; add plugin path and its subdirs to load-path
(let ((default-directory plugin-load-path))
  (normal-top-level-add-to-load-path '("."))
  (normal-top-level-add-subdirs-to-load-path))

;;----------el-get----------
(require 'package)
(setq package-archives (cons '("tromey" . "http://tromey.com/elpa/") package-archives))
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil t)
  (url-retrieve "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
                (lambda (s) (end-of-buffer) (eval-print-last-sexp))))

;;----------custom-setting---------
(require 'personal-information)
(require 'set-function)
(require 'set-environment)
(require 'set-custom)
(require 'set-editor)
(require 'set-buffer)
(require 'set-language)
(require 'set-ui)
(require 'set-application)
(require 'set-package)

;;----------server----------
;; start a server if there wasn't one
(unless (fboundp 'daemonp) (server-start))

;;; init.el ends here

(setq gnus-select-method
      '(nnimap "gmail"
               (nnimap-address "imap.gmail.com")
               (nnimap-server-port 993)
               (nnimap-stream ssl)
               (nnimap-authinfo-file "~/.authinfo.gpg")
               ))
(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
      smtpmail-auth-credentials '(("smtp.gmail.com" 587 "username@gmail.com" nil))
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587
      ;; smtpmail-local-domain "yourcompany.com"
      )

(if (locate-library "edit-server")
    (progn
      (require 'edit-server)
      (unless (daemonp)
        (setq edit-server-new-frame nil))
      (edit-server-start)))
