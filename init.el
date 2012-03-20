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

(defun toggle-line-spacing ()
  "Toggle line spacing between no extra space to extra half line height."
  (interactive)
  (if (eq line-spacing nil)
      (setq-default line-spacing 0.3) ; add 0.5 height between lines
    (setq-default line-spacing nil)   ; no extra heigh between lines
    )
  (redraw-display))
(setq-default line-spacing 0.3)
(global-set-key (kbd "<f7>") 'toggle-line-spacing)
