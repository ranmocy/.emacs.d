;;; econf.el
;; Ranmocy's Emacs Configurations -- A well-organized configurations.

;; Copyright (C) 2009, 2010, 2011, 2012
;; Author:   Ranmocy <Ranmocy@gmail.com>
;; Created:  someday in 2009
;; Updated:  2012-09-18
;; Version:  0.9.1-p0
;; Keywords: emacs, macos, linux, unixlike
;; Github:  `https://github.com/ranmocy/emacs_config'
;; GitCafe: `http://gitcafe.com/ranmocy/emacs_config'
;; Inspired-by: `https://github.com/overtone/emacs-live', `https://github.com/purcell/emacs.d'

;; Every file here should be packaged to `provide' a feature and be `require' by others.
;; Basically it can adapt to MacOS and any distribution of GNU/Linux.

;;----------Path----------
(defconst pack-load-path (expand-file-name "packs/" user-emacs-directory)
  "Where is my packs?")
(defconst custom-theme-load-path (list (expand-file-name "themes/" user-emacs-directory) t)
  "Some unpublished theme? Or Emacs defaults.")
(defconst personal-path (expand-file-name "personal/" user-emacs-directory)
  "We all want some place for personal only.")
(defconst custom-file (expand-file-name "customize.el" personal-path)
  "Emacs default customization file")


;; Set exec-path from shell
;; Quote from purcell/emacs.d
(let ((path-from-shell (replace-regexp-in-string "[ \t\n]*$" "" (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
  (setenv "PATH" path-from-shell)
  (setq exec-path (split-string path-from-shell path-separator)))


;; Load path
;; add custom path and its subdirs to load-path
(let ((default-directory pack-load-path))
  (normal-top-level-add-to-load-path '("."))
  (normal-top-level-add-subdirs-to-load-path))

(add-to-list 'load-path personal-path)


;;----------el-get----------
(require 'package)
(add-to-list 'package-archives '("tromey" . "http://tromey.com/elpa/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

(add-to-list 'load-path (expand-file-name "el-get/el-get" user-emacs-directory))
(unless (require 'el-get nil t)
  (url-retrieve "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
                (lambda (s) (goto-char (point-max)) (eval-print-last-sexp))))


;;----------custom-conf---------
(when (locate-library "customize")
  (require 'customize))

(defun load-econf (name)
  "Load econf with name."
  (let ((name (if (file-directory-p name)
                  (expand-file-name "init" name)
                name)))
    (when (file-exists-p name)
      (load-file name))
    ))

(let* ((extensions (directory-files pack-load-path t "^ext-"))
       (packs (directory-files pack-load-path t "^econf-")))
  (mapc #'load-econf extensions)
  (mapc #'load-econf packs))


;;----------el-get-sync----------
(el-get 'sync (append '(el-get) (mapcar 'el-get-source-name el-get-sources)))


;;----------test-conf-area----------
(when (locate-library "econf-test")
  (eval-after-init
   '(require 'econf-test)))


(provide 'econf)
;;; econf.el ends here
