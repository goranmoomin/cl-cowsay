;;;; default.lisp

(defpackage #:cl-cowsay.default
  (:use #:cl
        #:alexandria)
  (:export #:*defaults*
           #:defaults))

(in-package #:cl-cowsay.default)

(defparameter *defaults*
  (alist-hash-table
   '((:borg . ("==" "  " "\\"))
     (:dead . ("xx" "U " "\\"))
     (:greedy . ("$$" "  " "\\"))
     (:paranoia . ("@@" "  " "\\"))
     (:stoned . ("**" "U " "\\"))
     (:tired . ("--" "  " "\\"))
     (:wired . ("OO" "  " "\\"))
     (:youthful . (".." "  " "\\")))))

(defun defaults (mode)
  (gethash mode *defaults* '("oo" "  " "\\")))
