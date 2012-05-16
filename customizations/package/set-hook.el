;;==============================Hooks==============================
(add-to-list 'auto-mode-alist '("\\.zsh$" . shell-script-mode))
(add-to-list 'auto-mode-alist '("zshrc$" . shell-script-mode))

(defun yasnippet-hook ()
  (autoload 'yas/global-mode "yasnippet" nil t)
  (yas/initialize)
  (global-set-key [backtab] `yas/expand)
  ;; (setq yas/snippet-dirs '("~/.emacs.d/snippets"))
  (yas/load-directory "~/.emacs.d/snippets")
  (yas/global-mode 1))

(defun ruby-mode-hook ()
  (autoload 'ruby-mode "ruby-mode" nil t)
  (add-to-list 'auto-mode-alist '("Capfile" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Guardfile" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.ru\\'" . ruby-mode))
  (add-hook 'ruby-mode-hook
            '(lambda ()
               (setq ruby-deep-arglist t)
               (setq ruby-deep-indent-paren nil)
               (setq c-tab-always-indent nil)
               ;;(setq ruby-insert-encoding-magic-comment nil)
               ;;(remove-hook 'before-save-hook 'ruby-mode-set-encoding)
               ;;(defun ruby-mode-set-encoding () ())
               (require 'inf-ruby)
               (require 'ruby-compilation))))

(defun rhtml-mode-hook ()
  (autoload 'rhtml-mode "rhtml-mode" nil t)
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . rhtml-mode))
  (add-to-list 'auto-mode-alist '("\\.rjs\\'" . rhtml-mode)))

(defun yaml-mode-hook ()
  (autoload 'yaml-mode "yaml-mode" nil t)
  (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
  (add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode)))

(defun css-mode-hook ()
  (autoload 'css-mode "css-mode" nil t)
  (add-hook 'css-mode-hook '(lambda ()
                              (setq css-indent-level 2)
                              (setq css-indent-offset 2))))

(defun feature-mode-hook ()
  (autoload 'feature-mode "feature-mode" nil t)
  (add-to-list 'auto-mode-alist '("\.feature$" . feature-mode)))

(defun sass-mode-hook ()
  (autoload 'sass-mode "sass-mode" nil t)
  (add-to-list 'auto-mode-alist '("\.scss$" . sass-mode))
  (add-to-list 'auto-mode-alist '("\.sass$" . sass-mode)))

(defun markdown-mode-hook ()
  (autoload 'markdown-mode "markdown-mode.el" nil t)
  (add-to-list 'auto-mode-alist '("\\.\\(markdown\\|md\\|text\\)$" . markdown-mode))
  (define-key markdown-mode-map
    (kbd "<tab>")
    (lambda()
      (interactive)
      (let ((yas/fallback-behavior 'return-nil))
        (unless (yas/expand)
          (message "markdown-cycle should be called")
          (markdown-cycle))))))

(defun wanderlust-hook ()
  (autoload 'wl "wl" "Wanderlust" t)
  ;; (let ((default-directory (expand-file-name "el-get/" user-emacs-directory)))
  ;;   (normal-top-level-add-to-load-path
  ;;    '("apel" "flim" "semi" "wl"))
  ;;   (normal-top-level-add-to-load-path '("."))
  ;;   (normal-top-level-add-subdirs-to-load-path)
  ;;   )

  ;; wanderlust
  (autoload 'wl "wl" "Wanderlust" t)
  (autoload 'wl-other-frame "wl" "Wanderlust on new frame." t)
  (autoload 'wl-draft "wl-draft" "Write draft with Wanderlust." t)

  ;; IMAP
  (setq elmo-imap4-default-server "imap.gmail.com")
  (setq elmo-imap4-default-user "<accountname>@gmail.com") 
  (setq elmo-imap4-default-authenticate-type 'clear) 
  (setq elmo-imap4-default-port '993)
  (setq elmo-imap4-default-stream-type 'ssl)

  (setq elmo-imap4-use-modified-utf7 t) 

  ;; SMTP
  (setq wl-smtp-connection-type 'starttls)
  (setq wl-smtp-posting-port 587)
  (setq wl-smtp-authenticate-type "plain")
  (setq wl-smtp-posting-user "mattofransen")
  (setq wl-smtp-posting-server "smtp.gmail.com")
  (setq wl-local-domain "gmail.com")

  (setq wl-default-folder "%inbox")
  (setq wl-default-spec "%")
  (setq wl-draft-folder "%[Gmail]/Drafts") ; Gmail IMAP
  (setq wl-trash-folder "%[Gmail]/Trash")

  (setq wl-folder-check-async t) 

  (setq elmo-imap4-use-modified-utf7 t)

  (autoload 'wl-user-agent-compose "wl-draft" nil t)
  (if (boundp 'mail-user-agent)
      (setq mail-user-agent 'wl-user-agent))
  (if (fboundp 'define-mail-user-agent)
      (define-mail-user-agent
        'wl-user-agent
        'wl-user-agent-compose
        'wl-draft-send
        'wl-draft-kill
        'mail-send-hook))
  )

(provide 'set-hook)
