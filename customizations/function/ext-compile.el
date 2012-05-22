(defun byte-recompile-home ()
  (interactive)
  (byte-compile-file (expand-file-name "init.el" user-emacs-directory))
  (byte-recompile-directory custom-load-path))

(provide 'ext-compile)
