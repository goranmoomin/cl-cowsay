;;;; cl-cowsay.asd

(asdf:defsystem #:cl-cowsay
  :description "Describe cl-cowsay here"
  :author "Sungbin Jo"
  :license  "MIT"
  :version "0.0.1"
  :serial t
  :depends-on (#:cl-ppcre
               #:unix-opts)
  :components ((:file "balloon")
               (:file "replacer")
               (:file "cows")
               (:file "default")
               (:file "cl-cowsay")))
