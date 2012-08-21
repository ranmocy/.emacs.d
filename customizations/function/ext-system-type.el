;;; System types
;; `gnu'         compiled for a GNU Hurd system.
;; `gnu/linux'   compiled for a GNU/Linux system.
;; `darwin'      compiled for Darwin (GNU-Darwin, Mac OS X, ...).
;; `ms-dos'      compiled as an MS-DOS application.
;; `windows-nt'  compiled as a native W32 application.
;; `cygwin'      compiled using the Cygwin library.
;; `linux'       for `gnu' and `gnu/linux'
;; `darwin'      for `darwin'
;; `windows'     for `ms-dos', `windows-nt' and `cygwin'
;; `unixlike'    for `linux' and `darwin'

;;; system-type-p
(defun system-type-p (type)
  (case type
    (:linux (or (system-type-p :gnu) (system-type-p :gnu/linux)))
    (:windows (or (system-type-p :ms-dos) (system-type-p :windos-nt) (system-type-p :cygwin)))
    (:unixlike (or (system-type-p :darwin) (system-type-p :linux)))
    (:any t)
    (t (equal (subseq (symbol-name type) 1 nil) (symbol-name system-type)))))

;;; as-system-type
(defmacro set-as-system-type (name &rest args)
  `(set-if 'system-type-p ,name ,@args))

(defmacro funcall-as-system-type (&rest args)
  `(funcall-if 'system-type-p ,@args))

(provide 'ext-system-type)
