;; Place your bindings here.

;; For example:
;;(define-key global-map (kbd "C-+") 'text-scale-increase)
;;(define-key global-map (kbd "C--") 'text-scale-decrease)

(global-unset-key (kbd "C-z"))
(global-unset-key (kbd "C-x C-z"))

;; get rid of annoying kill region stuff
(put 'delete-region 'disabled t)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

(global-unset-key (kbd "C-x C-k")) ;; kill-region

(put 'kill-region 'interactive-form
     '(interactive
       (if (use-region-p)
           (list (region-beginning) (region-end))
         (list (point) (progn (forward-word) (point))))))

(defun comment-or-uncomment-region-or-line ()
  "Comments or uncomments the region or the current line if there's no active region."
  (interactive)
  (let (beg end)
    (if (region-active-p)
        (setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position)))
    (comment-or-uncomment-region beg end)))

(global-set-key (kbd "C-;") 'comment-or-uncomment-region-or-line)

;; Change return behavior to not change indentation on current line when inserting a newline
;; Normal binding id 'reindent-then-newline-and-indent
(add-hook 'clojure-mode-hook
          '(lambda ()
             (local-set-key (kbd "RET") 'newline-and-indent)))

(add-hook 'Javascript-IDE-mode-hook
          '(lambda ()
             (local-set-key (kbd "RET") 'newline-and-indent)))

;; Normally, killing the newline between indented lines doesn't remove any extra spaces
;; caused by indentation. This accomplishes that:
(defadvice kill-line (before check-position activate)
  (if (and (eolp) (not (bolp)))
      (progn (forward-char 1)
             (just-one-space 0)
             (backward-char 1))))
