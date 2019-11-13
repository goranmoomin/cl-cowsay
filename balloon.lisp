;;;; balloon.lisp

(defpackage #:cl-cowsay.balloon
  (:use #:cl)
  (:export #:say #:think))

(in-package #:cl-cowsay.balloon)

(defclass delimiters ()
  ((first :initarg :first :accessor del-first)
   (middle :initarg :middle :accessor del-middle)
   (last :initarg :last :accessor del-last)
   (only :initarg :only :accessor del-only)))

(defun make-delimiters (first middle last only)
  (make-instance 'delimiters
                 :first first
                 :middle middle
                 :last last
                 :only only))

(defun say (text wrap)
  (let ((delimiters (make-delimiters '("/" . "\\")
                                     '("|" . "|")
                                     '("\\" . "/")
                                     '("<" . ">"))))
    (format-balloon text wrap delimiters)))

(defun think (text wrap)
  (let ((delimiters (make-delimiters '("(" . ")")
                                     '("(" . ")")
                                     '("(" . ")")
                                     '("(" . ")"))))
    (format-balloon text wrap delimiters)))


(defun format-balloon (text wrap delimiters)
  (flet ((split (text wrap)
	   (labels ((split (line wrap)
		      (if (<= (length line) wrap) (list line)
			  (cons (subseq line 0 wrap) (split (subseq line wrap) wrap)))))
	     (let (result (lines (cl-ppcre:split (format nil "~%") text)))
	       (dolist (line lines (nreverse result))
		 (dolist (sub-line (split line wrap)) (push sub-line result)))))))
    (let* ((lines (if wrap (split text wrap) (list text)))
	   (max-length (apply #'max (mapcar #'length lines))))
      (flet ((pad (text length) (format nil "~va" length text))
	     (top (length) (make-string (+ length 2) :initial-element #\_))
	     (bottom (length) (make-string (+ length 2) :initial-element #\-))
	     (straddle (line delimiter)
	       (list (concatenate 'string (first delimiter) (pad line max-length) " " (rest delimiter)))))
	(format nil "~{~a~^~%~}"
		(append (list (concatenate 'string " " (top max-length)))
			(if (null (rest lines))
			    (straddle (first lines) (del-only delimiters))
			    (let ((first (first lines)) (middle (butlast (rest lines))) (last (first (last lines))))
			      (append (straddle first (del-first delimiters))
				      (mapcar #'(lambda(line) (straddle line (del-middle delimiters))) middle)
				      (straddle last (del-last delimiters)))))
			(list (concatenate 'string " " (bottom max-length)))))))))


