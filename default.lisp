;;;; default.lisp

(defpackage #:cl-cowsay.default
  (:use #:cl
        #:cl-cowsay.replacer)
  (:export #:*defaults*
           #:defaults))

(in-package #:cl-cowsay.default)

(defmacro gen-defaults ()
  `(progn
     (defparameter *defaults* (make-hash-table))
     ,@(loop :for (mode eyes tongue thoughts)
               :in '((:borg "==" "  " "\\")
                     (:dead "xx" "U " "\\")
                     (:greedy "$$" "  " "\\")
                     (:paranoia "@@" "  " "\\")
                     (:stoned "**" "U " "\\")
                     (:tired "--" "  " "\\")
                     (:wired "OO" "  " "\\")
                     (:youthful ".." "  " "\\"))
             :collect `(setf (gethash ,mode *defaults*)
                             (make-variables ,eyes ,tongue ,thoughts)))))

(gen-defaults)

(defun defaults (mode)
  (copy-variables (gethash mode *defaults* (make-variables "oo" "  " "\\"))))
