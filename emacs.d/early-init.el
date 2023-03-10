;; improve startup time by pausing garbage collection during init
(setq gc-cons-threshold most-positive-fixnum)
;; Disable package.el in favor of straight.el
(setq package-enable-at-startup nil)
