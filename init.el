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

(setq personal-path (expand-file-name "personal/" user-emacs-directory)) ; Personal files path
(setq custom-load-path (expand-file-name "customizations/" user-emacs-directory)) ; Customization files path
(setq custom-file (expand-file-name "customize.el" user-emacs-directory)) ; Emacs default customization file
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

(add-to-list 'load-path (expand-file-name "el-get/el-get" user-emacs-directory))
(unless (require 'el-get nil t)
  (url-retrieve "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
                (lambda (s) (end-of-buffer) (eval-print-last-sexp))))

(setq el-get-sources '())

;;----------custom-setting---------
(require 'customize)
(require 'set-function)
(require 'set-environment)
(require 'set-editor)
(require 'set-buffer)
(require 'set-language)
(require 'set-ui)
(require 'set-application)

(el-get 'sync
        (append '(el-get google-maps)
                (mapcar 'el-get-source-name el-get-sources)))

;;----------server----------
;; start a server if there wasn't one
(when (locate-library "server")
  (require 'server)
  (when (not (server-running-p server-name))
    (when (and (fboundp 'daemonp) (not (daemonp)))
      (server-start))))

;; start edit-server
(when (locate-library "edit-server")
  (require 'edit-server)
  ;; (unless (daemonp)
  ;;   (setq edit-server-new-frame nil)
  ;;   )
  (edit-server-start))

;;; init.el ends here
