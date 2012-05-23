(add-to-el-get-sources
 '(:name auto-complete)
 '(:name auto-complete-clang)
 '(:name auto-complete-css)
 '(:name auto-complete-emacs-lisp)
 '(:name auto-complete-etags)
 '(:name auto-complete-extension)
 '(:name auto-complete-ruby)
 '(:name auto-complete-yasnippet)
 )

(setf ac-comphist-file (expand-file-name "ac-comphist.dat" personal-path))

(provide 'set-auto-complete)
