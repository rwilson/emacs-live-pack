;; Buffer improvements (keep auto-updated, filter groups, etc)
(defvar default-exclude-dirs
  '("." ".." ".DS_Store"))

(defun dir-filter-groups (base &optional exclude-dirs)
  (remove nil
          (mapcar (lambda (dir)
                    (let ((name (file-name-nondirectory (directory-file-name dir))))
                      (when (not (member name
                                         (append default-exclude-dirs
                                                 exclude-dirs)))
                        `(,name (filename . ,(expand-file-name (concat base dir)))))))
                  (directory-files base))))

(setq ibuffer-show-empty-filter-groups nil)
(setq ibuffer-saved-filter-groups
      (list (cons "default"
                  (append (dir-filter-groups "~/Dev/outpostgames/")
                          '(("REPL" (or (mode . cider-repl-mode)
                                        (name . "\*nrepl-.*")
                                        (name . "\*cider-.*")))
                            ("Emacs Config" (or (name . ".*.emacs.d/.*")
                                                (name . ".*.el")))
                            ("Emacs" (name . "\*.*\*")))))))

(add-hook 'ibuffer-mode-hook
          '(lambda ()
             (ibuffer-auto-mode 1)
             (ibuffer-switch-to-saved-filter-groups "default")))

(setq ibuffer-formats
      '((mark modified
              read-only
              " "
              (name 30 30 :left :elide) ; change name chars from 18 -> 30
              " "
              ; hide the size column
              ;(size 9 -1 :right)
              ;" "
              ; GIT column would normally be here
              (mode 16 16 :left :elide) ; default
              " "
              filename-and-process)
        (mark " "
              (name 16 -1)
              " "
              filename)))
