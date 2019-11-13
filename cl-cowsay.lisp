;;;; cl-cowsay.lisp

(defpackage #:cl-cowsay
  (:use #:cl
        #:alexandria
        #:cl-cowsay.balloon
        #:cl-cowsay.cows
        #:cl-cowsay.default)
  (:export #:cowsay
           #:*cows*))

(in-package #:cl-cowsay)

(defun override-plist (source override)
  (let ((result (copy-list source)))
    (alexandria:doplist (key val override result)
      (when val (setf (getf result key) val)))))

(defun cowsay (text &key
                      (file "default") mode
                      eyes tongue thoughts
                      (wrap 40))
  (format nil "~a~%~a~%" (say text wrap)
          (apply #'get-cow
                 (override-plist (defaults mode) `(:file ,file :eyes ,eyes :tongue ,tongue :thoughts ,thoughts)))))


(in-package #:cl-cowsay)
