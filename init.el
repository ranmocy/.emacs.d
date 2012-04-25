;;====================init====================
;;----------define----------
;; (defvar *last-record-load-time* (current-time))
(setq emacsd-path "~/.emacs.d")
(setq plugin-path (concat emacsd-path "/plugins/"))
(setq custom-path (concat emacsd-path "/customize"))
(setq custom-file (concat custom-path "/set_custom.el"))
;; (setenv "OLDPATH" (getenv "PATH"))
;; (setenv "PATH" (concat "/usr/local/bin:" (getenv "OLDPATH")))
(add-to-list 'exec-path "/usr/local/bin/")
(add-to-list 'load-path plugin-path)
(load (concat emacsd-path "/personal-information.el"))

;;----------custom-setting---------
(load (concat custom-path "/set_functions"))
(load (concat custom-path "/set_environment"))
(load (concat custom-path "/set_custom"))
(load (concat custom-path "/set_editor"))
(load (concat custom-path "/set_buffer"))
(load (concat custom-path "/set_language"))
(load (concat custom-path "/set_ui"))
(load (concat custom-path "/set_x"))
(load (concat custom-path "/set_org"))
(load (concat custom-path "/set_application"))

(load (concat custom-path "/set_hook"))
(load (concat custom-path "/set_package"))

;;----------server----------
(unless (fboundp 'daemonp) (server-start))

;;----------evil----------
(add-to-list 'load-path "~/.emacs.d/plugins/evil")
(eval-after-load "evil"
  '(progn
     (define-key evil-normal-state-map "\C-r" 'isearch-backward)
     (define-key evil-normal-state-map "\C-e" 'end-of-line)
     (define-key evil-normal-state-map "\C-n" 'next-line)
     (define-key evil-normal-state-map "\C-p" 'previous-line)

     (define-key evil-insert-state-map "\C-r" 'isearch-backward)
     (define-key evil-insert-state-map "\C-e" 'end-of-line)
     (define-key evil-insert-state-map "\C-n" 'next-line)
     (define-key evil-insert-state-map "\C-p" 'previous-line)

     ;; viper-cua-region-fix
     (define-key viper-vi-global-user-map [backspace] 'backward-delete-char-untabify)
     (define-key viper-insert-global-user-map [backspace] 'backward-delete-char-untabify)
     ;; (define-key viper-vi-global-user-map "\C-d" 'delete-char)
     ;; (define-key viper-insert-global-user-map "\C-d" 'delete-char)
     ))
(require 'evil)
(evil-mode 1)
;; (setq evil-vi-state-id (concat (propertize "<V>" 'face 'hi-blue-b) " "))
;; (setq evil-emacs-state-id (concat (propertize "<E>" 'face 'hi-red-b) " "))
;; (setq evil-insert-state-id (concat (propertize "<I>" 'face 'hi-blue-b) " "))
;; (setq evil-replace-state-id (concat (propertize "<R>" 'face 'hi-blue-b) " "))
