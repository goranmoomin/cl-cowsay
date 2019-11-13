;;;; replace-cow.lisp

(defpackage #:cl-cowsay.replace-cow
  (:use #:cl)
  (:import-from #:cl-ppcre)
  (:export #:replace-cow))

(in-package #:cl-cowsay.replace-cow)

(defun replace-cow (cow eyes tongue thoughts)
  (setf cow (extract-cow cow))
  (setf cow (cl-ppcre:regex-replace-all "\\$thoughts" cow thoughts))
  (setf cow (cl-ppcre:regex-replace-all "\\$eyes" cow eyes))
  (setf cow (cl-ppcre:regex-replace-all "\\$\\{eyes\\}" cow eyes))
  (setf cow (cl-ppcre:regex-replace-all "\\$tongue" cow tongue))
  (setf cow (cl-ppcre:regex-replace-all "\\$\\{tongue\\}" cow tongue))
  (setf cow (cl-ppcre:regex-replace "\\$eye" cow (string (char eyes 0))))
  (setf cow (cl-ppcre:regex-replace "\\$eye" cow (string (char eyes 1))))
  cow)

(defun extract-cow (str)
  (cl-ppcre:register-groups-bind (cow)
      ("\\$the_cow\\s*=\\s*<<\"*EOC\"*;*\\n([\\s\\S]+)\\nEOC\\n" str) cow))
