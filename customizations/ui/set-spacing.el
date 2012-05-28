(defun toggle-line-spacing ()
  "Toggle line spacing between no extra space to extra half line height."
  (interactive)
  (if (eq line-spacing nil)
      (setq-default line-spacing 0.1) ; add 0.5 height between lines
    (setq-default line-spacing nil)   ; no extra heigh between lines
    )
  (redraw-display))
(setq-default line-spacing 0.3)
(global-set-key (kbd "<f7>") 'toggle-line-spacing)

(provide 'set-spacing)
