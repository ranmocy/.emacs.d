(if (system-type-darwin-p)
    (setq ispell-program-name "/usr/local/bin/aspell")
  (if (system-type-linux-p)
      (setq ispell-program-name "/usr/bin/aspell")))

(provide 'set-ispell)
