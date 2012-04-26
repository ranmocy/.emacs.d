(when (system-type-darwin-p)
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier 'super)
  (setq mac-control-modifier 'control)
  (setq mac-function-modifier 'super)
  (setq mac-right-option-modifier nil)
  (setq mac-allow-anti-aliasing t)      ; anti-aliasing with mac system
  )

(provide 'set-mac-modifier)
