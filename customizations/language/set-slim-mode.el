;; TODO
;; It is under plugins/ now.
;; (add-to-el-get-sources
;;  '(:name slim-mode
;;          :type emacswiki
;;          :url "http://github.com/stonean/slim"))

(autoload 'slim-mode "slim-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.slim$" . slim-mode))

(provide 'set-slim)
