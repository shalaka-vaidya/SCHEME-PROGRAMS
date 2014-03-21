;cl is the list that counts the number of times n appeared
(define cl '())
;;as specified in the question
(define (frequency L n cl)
;when the list is completely iterated	
	(cond ((null? L) (length cl))
	      (else 
		(cond ((= n (car L)) 
			(frequency (cdr L) n (cons 1 cl)))
		       (else (frequency (cdr L) n cl))))))

