;;;; default.lisp

(defpackage #:cl-cowsay.default
  (:use #:cl
        #:alexandria)
  (:export #:*defaults*
           #:defaults))

(in-package #:cl-cowsay.default)

(defparameter *defaults*
  (alist-hash-table
   '((:borg . (:eyes "==" :tongue "  " :thoughts "\\"))
     (:dead . (:eyes "xx" :tongue "U " :thoughts "\\"))
     (:greedy . (:eyes "$$" :tongue "  " :thoughts "\\"))
     (:paranoia . (:eyes "@@" :tongue "  " :thoughts "\\"))
     (:stoned . (:eyes "**" :tongue "U " :thoughts "\\"))
     (:tired . (:eyes "--" :tongue "  " :thoughts "\\"))
     (:wired . (:eyes "OO" :tongue "  " :thoughts "\\"))
     (:youthful . (:eyes ".." :tongue "  " :thoughts "\\")))))

(defun defaults (mode)
  (gethash mode *defaults* '(:eyes "oo" :tongue "  " :thoughts "\\")))
