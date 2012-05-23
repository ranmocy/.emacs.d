(add-to-el-get-sources
 '(:name yasnippet
         :type git
         :url "git://github.com/capitaomorte/yasnippet.git"
         :after (lambda ()
                  (autoload 'yas/global-mode "yasnippet" nil t)
                  (yas/global-mode 1))))

(eval-after-load "yasnippet"
  '(progn
     (setq yas/root-directory (expand-file-name "snippets" user-emacs-directory))
     (yas/load-directory yas/root-directory)
     (yas/load-directory (expand-file-name "snippets" (file-name-directory (locate-library "yasnippet"))))
     (yas/load-directory (expand-file-name "extras/imported" (file-name-directory (locate-library "yasnippet"))))
     (global-set-key [backtab] `yas/expand))
  )

(provide 'set-yasnippet)
