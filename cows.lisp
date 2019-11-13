;;;; cows.lisp

(defpackage #:cl-cowsay.cows
  (:use #:cl #:alexandria #:cl-cowsay.replace-cow)
  (:export #:*cows* #:get-cow))

(in-package #:cl-cowsay.cows)

(defun load-cows-from-filesystem (cowsay-path)
  (loop :for file-name :in (directory (merge-pathnames (make-pathname :directory '(:relative "cows") :name :wild :type "cow")
                                                       cowsay-path))
     :for file-contents := (cl-ppcre:regex-replace-all "\\\\\\\\" (uiop:read-file-string file-name) "\\")
     :collect (cons (pathname-name file-name) file-contents)))
  
	    
(defparameter *cows* (alexandria:alist-hash-table
		      (load-cows-from-filesystem #.(or *compile-file-pathname* *load-pathname*)) :test 'equal))

(defun get-cow (&key file eyes tongue thoughts)
  (let ((cow (gethash file *cows*)))
    (replace-cow cow eyes tongue thoughts)))

