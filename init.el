;; User pack init file
;;
;; Use this file to initiate the pack configuration.
;; See README for more information.

;; Load bindings config
(live-load-config-file "bindings.el")
(live-load-config-file "buffers.el")
(live-load-config-file "clojure-indent.el")
(live-load-config-file "desktop.el")
(live-load-config-file "lua.el")
;; (live-load-config-file "p4.el")
(live-load-config-file "web.el")

(menu-bar-mode)

(add-to-list 'warning-suppress-types '(undo discard-info))
