(add-to-el-get-sources
 '(:name yasnippet
         :type git
         :url "git://github.com/capitaomorte/yasnippet.git"
         :after (lambda () (yasnippet-hook))))

(defun yasnippet-hook ()
  (autoload 'yas/global-mode "yasnippet" nil t)
  (setq yas/root-directory (expand-file-name "snippets" user-emacs-directory))
  (yas/global-mode 1)
  (yas/load-directory yas/root-directory)
  (yas/load-directory (expand-file-name "snippets" (file-name-directory (locate-library "yasnippet"))))
  (yas/load-directory (expand-file-name "extras/imported" (file-name-directory (locate-library "yasnippet"))))
  (global-set-key [backtab] `yas/expand)
  )

(provide 'set-yasnippet)
