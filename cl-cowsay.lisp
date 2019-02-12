;;;; cl-cowsay.lisp

(defpackage #:cl-cowsay
  (:use #:cl
        #:cl-cowsay.balloon
        #:cl-cowsay.replacer
        #:cl-cowsay.cows)
  (:import-from #:unix-opts)
  (:export #:cowsay))

(in-package #:cl-cowsay)

(defun cowsay (text &key
                      (file "default")
                      mode eyes tongue
                      (thoughts "\\")
                      (wrap 40))
  (multiple-value-bind (eyes tongue)
      (case mode
        (:borg (values "==" "  "))
        (:dead (values "xx" "U "))
        (:greedy (values "$$" "  "))
        (:paranoia (values "@@" "  "))
        (:stoned (values "**" "U "))
        (:tired (values "--" "  "))
        (:wired (values "OO" "  "))
        (:youthful (values ".." "  "))
        (otherwise (values (or eyes "oo") (or tongue "  "))))
    (format nil "~a~%~a~%"
            (say text wrap)
            (get-cow file (make-variables eyes tongue thoughts)))))

(in-package #:cl-cowsay)
