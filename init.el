;;========================================init========================================
;;----------define----------
(setq current-os 'macos) ;; linux, macos
(setq current-env 'gui) ;; term, gui
(defvar *last-record-load-time* (current-time))

;;----------path---------
(setq custom-file "~/.emacs.d/customize/set_custom.el")
(push "/usr/local/bin" exec-path)

;;----------custom-setting---------
(push "~/.emacs.d/customize/" load-path)
(load "set_custom")
(load "set_environment")
(load "set_editor")
(load "set_buffer")
(load "set_language")
(load "set_ui")
(load "set_x")
(load "set_application")

(load "set_hook")
(load "set_package")
(pop load-path)

;;----------server----------
(server-start)
