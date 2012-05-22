(add-to-el-get-sources
 '(:name auctex
         :elpa
         :after (lambda ()
                  (autoload 'latex-mode "tex-site" nil t))))

(eval-after-load "tex-site"
  '(progn
     (setq
      TeX-auto-save t
      ;; TeX-parse-self t
      )
     (setq-default
      TeX-engine 'xelatex
      ;; TeX-master nil
      )
     ;; (add-hook 'LaTeX-mode-hook 'LaTeX-install-toolbar)
     ;; (add-hook 'LaTeX-mode-hook 'turn-on-auto-fill)
     (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
     (add-hook 'LaTeX-mode-hook 'tex-pdf-mode)
     ))

(provide 'set-auctex)
