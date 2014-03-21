;;checks the vaidity of day
(define (ipdv ls)
	(cond ((= 2 (cadr (cadar ls)))
		(if (> 28 (caadar ls))
			(ipmv ls)
			#f
		))
	      ((< 31 (caadar ls)) #f)
	      (else (ipmv ls))))
;;checks the validity of month
(define (ipmv ls)
	(cond ((< 12 (cadr (cadar ls))) #f)
	      (else (ipyv ls))))
;;checks the validity of year
(define (ipyv ls)
	(cond ((> 1 (caddr (cadar ls))) #f)
	      (else #t)))
;;compares the list and returns name of eldest member
(define (elder n q)
	(if (null? q) (car n)
	(cond ((> (car (cdr (cdr (car (cdr n))))) (caddr (cadar q)))
		(elder (car q) (cdr q)))
	      ((> (car (cdr (car (cdr q)))) (cadr (cadar q)))
		(elder (car q) (cdr q)))
	      ((> (caadr q) (caadar q))
		(elder (car q) (cdr q)))
	      (else (elder n (cdr q))))))
;;creates a copy of given list
(define op ls)
;;main funtion which is called
(define (main ls)
	(if (null? ls) (elder (car op) (cdr op))
		(if (equal? (ipdv ls) #t) (main (cdr ls))
		    #f)))
