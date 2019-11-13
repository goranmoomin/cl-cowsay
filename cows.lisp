;;;; cows.lisp

(defpackage #:cl-cowsay.cows
  (:use #:cl
        #:alexandria
        #:cl-cowsay.replace-cow)
  (:export #:*cows*)
  (:export #:get-cow))

(in-package #:cl-cowsay.cows)

(defmacro load-cows-from-filesystem ()
  `',(loop :for file-name :in (directory (merge-pathnames (make-pathname :directory '(:relative "cows") :name :wild :type "cow")
                                                          (or *compile-file-pathname* *load-pathname*)))
           :for file-contents := (cl-ppcre:regex-replace-all "\\\\\\\\" (uiop:read-file-string file-name) "\\")
           :collect (cons (pathname-name file-name) file-contents)))

(defparameter *cows* (alexandria:alist-hash-table (load-cows-from-filesystem) :test 'equal))

(defun get-cow (&key file eyes tongue thoughts)
  (let ((cow (gethash file *cows*)))
    (replace-cow cow eyes tongue thoughts)))
