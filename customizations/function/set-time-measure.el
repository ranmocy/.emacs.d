;; (defvar *last-record-load-time* (current-time))
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

(provide 'set-time-measure)
