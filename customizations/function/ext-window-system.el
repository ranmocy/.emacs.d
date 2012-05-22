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

(provide 'ext-window-system)
