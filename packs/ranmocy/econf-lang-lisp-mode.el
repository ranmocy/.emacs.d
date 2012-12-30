(setq
 max-lisp-eval-depth 40000              ;lisp最大执行深度
 max-specpdl-size 10000                 ;最大容量
 eval-expression-print-length nil       ;设置执行表达式的长度没有限制
 eval-expression-print-level nil        ;设置执行表达式的深度没有限制
 )

(provide 'econf-lang-lisp-mode)
