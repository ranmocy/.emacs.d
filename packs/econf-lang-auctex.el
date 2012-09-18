(add-to-el-get-sources
 '(:name auctex
         :type elpa
         ;; :url "git://github.com/emacsmirror/auctex.git"
         :after (lambda ()
                  (autoload 'latex-mode "tex-site" nil t))))

(eval-after-load "tex-site"
  '(progn
     (load "auctex.el" nil t t)
     (load "preview-latex.el" nil t t)
     (setq
      TeX-auto-save t
      TeX-parse-self t
      )
     (setq-default
      TeX-engine 'xelatex
      TeX-master nil
      )
     (add-hook 'LaTeX-mode-hook 'LaTeX-install-toolbar)
     (add-hook 'LaTeX-mode-hook 'turn-on-auto-fill)
     (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
     (add-hook 'LaTeX-mode-hook 'tex-pdf-mode)
     ))

(provide 'econf-lang-auctex)
