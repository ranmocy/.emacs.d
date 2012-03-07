;;====================init====================
;;----------define----------
;; (defvar *last-record-load-time* (current-time))
(setq custom-file "~/.emacs.d/customize/set_custom.el")
(setq plugin-path "~/.emacs.d/plugins/")
(setenv "OLDPATH" (getenv "PATH"))
(setenv "PATH" (concat "/usr/local/bin:" (getenv "OLDPATH")))
(add-to-list 'exec-path "/usr/local/bin/")
(add-to-list 'load-path plugin-path)

;;----------custom-setting---------
(load "~/.emacs.d/customize/set_functions")
(load "~/.emacs.d/customize/set_environment")
(load "~/.emacs.d/customize/set_custom")
(load "~/.emacs.d/customize/set_editor")
(load "~/.emacs.d/customize/set_buffer")
(load "~/.emacs.d/customize/set_language")
(load "~/.emacs.d/customize/set_ui")
(load "~/.emacs.d/customize/set_x")
(load "~/.emacs.d/customize/set_application")

(load "~/.emacs.d/customize/set_hook")
(load "~/.emacs.d/customize/set_package")

;;----------server----------
(unless (fboundp 'daemonp) (server-start))
