;; `nil' text-only
;; `ns'  MacOS
;; `w32' Windows
;; `cui' for `nil'
;; TODO: Where is Linux?
;; `gui' for `ns' and `w32'

(defun window-system-p (system)
  (case system
    (:cui (window-system-p :nil))
    (:gui (or (window-system-p :ns) (window-system-p :w32)))
    (t (equal (subseq (symbol-name system) 1 nil) (symbol-name window-system)))))

(provide 'ext-window-system)
