;;====================Macros&Functions====================
;;----------Time-Measure----------
(defun time-interval (from-time to-time)
  (message "Emacs loaded in %fs"
           (* 0.000001 (apply #'-
                              (mapcar (lambda (time)
                                        (+ (* 1000000 (+ (* 65536 (first time)) (second time))) (third time)))
                                      (list to-time from-time)))))
  )
(defun emacs-load-part-time ()
  (time-interval *last-record* (current-time))
  (setq *last-record-load-time* (current-time)))

;;----------System-Type----------
;; `gnu'         compiled for a GNU Hurd system.
;; `gnu/linux'   compiled for a GNU/Linux system.
;; `darwin'      compiled for Darwin (GNU-Darwin, Mac OS X, ...).
;; `ms-dos'      compiled as an MS-DOS application.
;; `windows-nt'  compiled as a native W32 application.
;; `cygwin'      compiled using the Cygwin library.
(defun system-type-darwin-p ()
  (eq system-type 'darwin)
  )
(defun system-type-linux-p ()
  (or
   (eq system-type 'gnu)
   (eq system-type 'gnu/linux)
   ))
(defun system-type-windows-p ()
  (or
   (eq system-type 'ms-dos)
   (eq system-type 'windows-nt)
   (eq system-type 'cygwin)
   ))
(defun system-type-unix-like-p ()
  (or (system-type-linux-p) (system-type-darwin-p))
  )

;;----------Windows-System----------
;; `nil' text-only
;; `ns'  MacOS
;; `w32' Windows
(defun window-system-cui-p ()
  (eq window-system 'nil)
  )
(defun window-system-gui-p ()
  (or
   (eq window-system 'ns)
   (eq window-system 'x)
   (eq window-system 'w32)
   ))

;;----------Byte-Recompile----------
(defun byte-recompile-home ()
  (interactive)
  (byte-recompile-file "~/.emacs.d/init.el")
  (byte-recompile-directory "~/.emacs.d/customize/"))
