;; enable desktop mode, auto-saves, x-session undo history
(require 'desktop)
(desktop-save-mode 1)
(setq history-length 250)
(add-to-list 'desktop-globals-to-save 'file-name-history)
