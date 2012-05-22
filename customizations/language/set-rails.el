(require 'set-ruby-mode)
(require 'set-yaml-mode)
(require 'set-rhtml-mode)
(require 'set-haml-mode)
(require 'set-slim-mode)
(require 'set-css-mode)
(require 'set-sass-mode)
(require 'set-cucumber)
(add-to-el-get-sources
 '(:name rinari
         :type git
         :url "git://github.com/eschulte/rinari.git"))

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

(provide 'set-rails)
