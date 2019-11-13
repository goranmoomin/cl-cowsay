;;;; cl-cowsay.lisp

(defpackage #:cl-cowsay
  (:use #:cl
        #:cl-cowsay.balloon
        #:cl-cowsay.cows
        #:cl-cowsay.default)
  (:export #:cowsay
           #:*cows*))

(in-package #:cl-cowsay)

(defun cowsay (text &key (file "default") mode eyes tongue thoughts (wrap 40))
  (destructuring-bind (default-eyes default-tongue default-thoughts) (defaults mode)
    (format nil "~a~%~a~%" (say text wrap)
            (get-cow file (or eyes default-eyes) (or tongue default-tongue) (or thoughts default-thoughts)))))

(in-package #:cl-cowsay)
