(require 'econf-lang-ruby-mode)
(require 'econf-lang-yaml-mode)
(require 'econf-lang-rhtml-mode)
(require 'econf-lang-haml-mode)
(require 'econf-lang-slim-mode)
(require 'econf-lang-css-mode)
(require 'econf-lang-sass-mode)
(require 'econf-lang-less-mode)
(require 'econf-lang-cucumber)

(add-to-el-get-sources
 '(:name rinari
         :type git
         :url "git://github.com/eschulte/rinari.git"))

(setq rinari-tags-file-name "TAGS")

;; helper-function
(defun is-rails-project ()
  (when (textmate-project-root)
    (file-exists-p (expand-file-name "config/environment.rb" (textmate-project-root)))))

(defun run-rails-test-or-ruby-buffer ()
  (interactive)
  (if (is-rails-project)
      (let* ((path (buffer-file-name))
             (filename (file-name-nondirectory path))
             (test-path (expand-file-name "test" (textmate-project-root)))
             (command (list ruby-compilation-executable "-I" test-path path)))
        (pop-to-buffer (ruby-compilation-do filename command)))
    (ruby-compilation-this-buffer)))

(provide 'econf-lang-rails)
