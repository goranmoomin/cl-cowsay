;;;; cl-cowsay.lisp

(defpackage #:cl-cowsay
  (:use #:cl
        #:cl-cowsay.balloon
        #:cl-cowsay.replacer
        #:cl-cowsay.cows
        #:cl-cowsay.default)
  (:export #:cowsay))

(in-package #:cl-cowsay)

(defun cowsay (text &key
                      (file "default") mode
                      eyes tongue thoughts
                      (wrap 40))
  (let ((variables (defaults mode)))
    (when eyes (setf (eyes variables) eyes))
    (when tongue (setf (tongue variables) tongue))
    (when thoughts (setf (thoughts variables) thoughts))
    (format nil "~a~%~a~%" (say text wrap) (get-cow file variables))))

(in-package #:cl-cowsay)
