(defmacro add-to-el-get-sources (&rest plists)
  `(progn
     (dolist (plist (list ,@plists))
       (add-to-list 'el-get-sources plist))
     el-get-sources))

(provide 'ext-el-get)
