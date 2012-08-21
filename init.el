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
(setq personal-path (expand-file-name "personal/" user-emacs-directory)) ; Personal files path
(setq custom-file (expand-file-name "customize.el" personal-path)) ; Emacs default customization file
(setq custom-load-path (expand-file-name "customizations/" user-emacs-directory)) ; Customization files path
(setq plugin-load-path (expand-file-name "plugins/" user-emacs-directory)) ; Third-party packages path
(setq custom-theme-load-path (list (expand-file-name "themes/" user-emacs-directory) t)) ; t for Emacs 24 default themes

(add-to-list 'exec-path "/usr/local/bin")

(add-to-list 'load-path personal-path)

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
(add-to-list 'package-archives '("SC"   . "http://joseito.republika.pl/sunrise-commander/"))
(add-to-list 'package-archives '("tromey" . "http://tromey.com/elpa/"))
(package-initialize)

(add-to-list 'load-path (expand-file-name "el-get/el-get" user-emacs-directory))
(unless (require 'el-get nil t)
  (url-retrieve "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
                (lambda (s) (end-of-buffer) (eval-print-last-sexp))))

;;----------custom-setting---------
(if (file-exists-p custom-file)
    (require 'customize)
  (make-directory (file-name-directory custom-file))
  (copy-file (expand-file-name "customize.el.example" user-emacs-directory) custom-file))
(require 'set-function)
(require 'set-environment)
(require 'set-editor)
(require 'set-buffer)
(require 'set-language)
(require 'set-ui)
(require 'set-application)

;;----------server----------
;; start a server if there wasn't one
(when (locate-library "server")
  (require 'server)
  (when (not (server-running-p server-name))
    (when (and (fboundp 'daemonp) (not (daemonp)))
      (server-start))))

;;----------el-get-sync----------
;; (el-get 'sync (append '(el-get) (mapcar 'el-get-source-name el-get-sources)))
(el-get 'sync)

;;; init.el ends here


;; (global-set-key (kbd "C-x C-i") 'idomenu)
;; (global-set-key [S-mouse-1] 'imenu)
(setq imenu-auto-rescan t)

;; (global-whitespace-mode)
;; make whitespace-mode use “¶” for newline and “▷” for tab.
;; together with the rest of its defaults
(setq whitespace-display-mappings
 '(
   (space-mark 32 [183] [46]) ; normal space, ·
   (space-mark 160 [164] [95])
   (space-mark 2208 [2212] [95])
   (space-mark 2336 [2340] [95])
   (space-mark 3616 [3620] [95])
   (space-mark 3872 [3876] [95])
   (newline-mark 10 [182 10]) ; newlne, ¶
   (tab-mark 9 [9655 9] [92 9]) ; tab, ▷
))

(defun sudo-find-file (file-name)
  "Like find file, but opens the file as root."
  (interactive "FSudo Find File: ")
  (let ((tramp-file-name (concat "/sudo::" (expand-file-name file-name))))
    (find-file tramp-file-name)))

;; Smex -- ido-like prompt suggester
;; (global-set-key (kbd "M-x") 'smex)
;; (global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; ;; This is your old M-x.
;; (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
;; (setq smex-prompt-string "主人~要...干什么？ ")
;; (setq smex-save-file (expand-file-name "smex-items" personal-path))

;;key-bindings
(global-unset-key (kbd "s-p"))
