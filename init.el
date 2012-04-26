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

