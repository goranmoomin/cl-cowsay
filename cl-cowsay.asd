;;;; cl-cowsay.asd

(asdf:defsystem #:cl-cowsay
  :description "Describe cl-cowsay here"
  :author "Sungbin Jo"
  :license  "MIT"
  :version "0.0.1"
  :serial t
  :depends-on (#:alexandria
               #:cl-ppcre)
  :components ((:file "balloon")
               (:file "replace-cow")
               (:file "cows")
               (:file "default")
               (:file "cl-cowsay")))
