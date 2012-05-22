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

(provide 'ext-system-type)
