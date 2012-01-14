;;========================================init========================================
;;----------define----------
(setq current-os 'macos) ;; linux, macos
(setq current-env 'gui) ;; term, gui
;;----------macro----------
(defun current-os-p (os)
  "Judge whether current operating system equal to 'os."
  (equal current-os os)
  )
(defun current-env-p (env)
  "Judge wheter current enviroment equal to 'env."
  (equal current-env env)
  )

;;----------path---------
(push "/usr/local/bin" exec-path)
(push "~/.emacs.d" load-path)
(push "~/.emacs.d/setups" load-path)
(setq custom-file "~/.emacs.d/customize/set_custom.el")

;;----------custom-setting---------
(push "~/.emacs.d/customize" load-path)
(load "set_package.el")
(load "set_environment.el")
(load "set_custom.el")
(load "set_editor.el")
(load "set_buffer.el")
(load "set_language.el")
(load "set_ui.el")
;;(load "set_x.el")
(pop load-path)

;;----------application----------
(load "set_calendar.el")
(load "set_bookmark.el")
(load "set_todo.el")

(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t) 
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on t)
