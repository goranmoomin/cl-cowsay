;;;; replacer.lisp

(defpackage #:cl-cowsay.replacer
  (:use #:cl)
  (:import-from #:cl-ppcre)
  (:export #:variables
           #:make-variables
           #:copy-variables
           #:eyes #:tongue #:thoughts)
  (:export #:replacer))

(in-package #:cl-cowsay.replacer)

(defclass variables ()
  ((eyes :initarg :eyes :accessor eyes)
   (tongue :initarg :tongue :accessor tongue)
   (thoughts :initarg :thoughts :accessor thoughts)))

(defun make-variables (eyes tongue thoughts)
  (make-instance 'variables :eyes eyes :tongue tongue :thoughts thoughts))

(defun copy-variables (source)
  (make-variables (eyes source) (tongue source) (thoughts source)))

(defun replacer (cow variables)
  (setf cow (extract-cow cow))
  (let ((eyes (eyes variables))
        (tongue (tongue variables))
        (thoughts (thoughts variables)))
    (setf cow (cl-ppcre:regex-replace-all "\\$thoughts" cow thoughts))
    (setf cow (cl-ppcre:regex-replace-all "\\$eyes" cow eyes))
    (setf cow (cl-ppcre:regex-replace-all "\\$\\{eyes\\}" cow eyes))
    (setf cow (cl-ppcre:regex-replace-all "\\$tongue" cow tongue))
    (setf cow (cl-ppcre:regex-replace-all "\\$\\{tongue\\}" cow tongue))
    (setf cow (cl-ppcre:regex-replace "\\$eye" cow (char eyes 0)))
    (setf cow (cl-ppcre:regex-replace "\\$eye" cow (char eyes 1)))
    cow))

(defun extract-cow (str)
  (cl-ppcre:register-groups-bind (cow)
      ("\\$the_cow\\s*=\\s*<<\"*EOC\"*;*\\n([\\s\\S]+)\\nEOC\\n" str) cow))
