(when (system-type-linux-p)
  (setq
   browse-url-browser-function 'browse-url-generic
   browse-url-generic-program "google-chrome"
   )
  )

(provide 'set-browser)
