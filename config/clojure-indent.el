;; Clojure customizations
(require 'clojure-mode)
(define-clojure-indent
  (defroutes 'defun)
  (GET 2)
  (POST 2)
  (PUT 2)
  (DELETE 2)
  (HEAD 2)
  (ANY 2)
  (context 2)
  (rfn 1)
  (-> 1)
  (->> 1)
  (some-> 1)
  (some->> 1)
  (cond-> 1)
  (cond->> 1)
  (as-> 2)
  (s/defrecord 1)
  (assoc 1)
  (dissoc 1)
  (trace 1)
  (debug 1)
  (info 1)
  (warn 1)
  (error 1)
  (tracef 1)
  (debugf 1)
  (infof 1)
  (warnf 1)
  (errorf 1))
