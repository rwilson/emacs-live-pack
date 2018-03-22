;; Support for editing JSX files
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.jsx?$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(defadvice web-mode-highlight-part (around tweak-jsx activate)
  (if (equal web-mode-content-type "jsx")
      (let ((web-mode-enable-part-face nil))
        ad-do-it)
    ad-do-it))

(add-hook 'web-mode-hook
          '(lambda ()
             (setq web-mode-code-indent-offset 2)
             (setq web-mode-css-indent-offset 2)
             (setq web-mode-markup-indent-offset 2)
             (setq web-mode-attr-indent-offset 2)
             (setq web-mode-indent-style 2)
             (setq web-mode-script-padding 2)
             (setq web-mode-style-padding 2)))

(add-hook 'json-mode-hook
          '(lambda ()
             (make-local-variable 'js-indent-level)
             (setq js-indent-level 2)))

(add-hook 'css-mode-hook
          '(lambda ()
             (make-local-variable 'css-indent-offset)
             (setq css-indent-offset 2)))
