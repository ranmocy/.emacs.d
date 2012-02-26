;;====================init====================
;;----------define----------
(defvar *last-record-load-time* (current-time))
(push "/usr/local/bin" exec-path)
(setq custom-file "~/.emacs.d/customize/set_custom.el")

;;----------custom-setting---------
(load "~/.emacs.d/customize/set_functions")
(load "~/.emacs.d/customize/set_environment")
;;(load "~/.emacs.d/customize/set_custom")
(load "~/.emacs.d/customize/set_editor")
(load "~/.emacs.d/customize/set_buffer")
(load "~/.emacs.d/customize/set_language")
(load "~/.emacs.d/customize/set_ui")
(load "~/.emacs.d/customize/set_x")
(load "~/.emacs.d/customize/set_application")

(load "~/.emacs.d/customize/set_hook")
(load "~/.emacs.d/customize/set_package")

;;----------server----------
(server-start)
