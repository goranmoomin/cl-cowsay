;;;; cl-cowsay.lisp

(defpackage #:cl-cowsay
  (:use #:cl
        #:cl-cowsay.balloon
        #:cl-cowsay.replacer
        #:cl-cowsay.cows)
  (:import-from #:unix-opts)
  (:export #:cowsay))

(in-package #:cl-cowsay)

(defun cowsay (text &key file eye tongue thoughts wrap)
  (format nil "~a~%~a~%"
          (say text wrap)
          (get-cow file (make-variables eye tongue thoughts))))

(in-package #:cl-cowsay)
