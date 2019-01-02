;;;; cows.lisp

(defpackage #:cl-cowsay.cows
  (:use #:cl
        #:cl-cowsay.replacer)
  (:export #:*all-cows*)
  (:export #:get-cow))

(in-package #:cl-cowsay.cows)

(eval-when (:compile-toplevel)
  (ql:quickload '#:cl-ppcre))

(defmacro gen-cows ()
  `(progn
     (defparameter *all-cows* (make-hash-table :test 'equal))
     ,@(loop :for file-name :in (directory (merge-pathnames (make-pathname :directory '(:relative "cows/")
                                                                           :name :wild
                                                                           :type "cow")
                                                            (or *compile-file-pathname*
                                                                *load-pathname*)))
             :for file-contents
               := (cl-ppcre:regex-replace-all "\\\\\\\\"
                                              (uiop:read-file-string file-name) "\\")
             :collect `(setf
                        (gethash ',(pathname-name file-name) *all-cows*)
                        ,file-contents))))

(gen-cows)

(defun get-cow (file variables)
  (let ((cow (gethash file *all-cows*)))
    (replacer cow variables)))
