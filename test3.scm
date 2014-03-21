;;(define route-log '((KL-234 (12 00) (12 40)) (KL-244 (3 56) (7 60)) (KL-765 (1 20) (1 30))))
;;(define route-log '((KL-234 (12 15) (12 40)) (KL-244 (3 00) (7 00)) (KL-765 (20 20) (21 30))))
(define (main1 route-log)
	(get-srno (main route-log)))
;;returns first travel record
(define (first-rec ls)
	(car ls))
;;returns the travel records except the first record
(define (rest-of-records ls)
	(cdr ls))
;;returns starting time for the travel record
(define (get-st rec)
	(cadr rec))
;;returns ending time for the travel record
(define (get-et rec)
	(caddr rec))
;;return the hour for the particular travel-record
(define (get-hr time)
	(car time))
;;return the minutes for the particular travel-record
(define (get-min time)
	(cadr time))
;;returns the registration number for particular travel-record
(define (get-srno rec)
	(car rec))
;;returns #t if only 1 record exists in ls else returns false
(define (only1rec? ls)
	(if (= (length ls) 1) #t #f))
;;calculates the time taken for particular list
(define (make-time-taken rec)
	(+ (- (get-hr (get-et rec)) (get-hr (get-st rec)))
	   (/ (- (get-min (get-et rec)) (get-min (get-st rec))) 60)))
;;returns the travel-record which takes lesser time to travel
(define (get-less-time-taken rec1 rec2)
	(if (> (make-time-taken rec1) (make-time-taken rec2)) rec2 rec1))
;;main procedure which returns the serial number of the bus which takes shortest time
(define (main route-log)
	(cond ((equal? #t (only1rec? route-log)) (first-rec route-log))
		  (else (get-less-time-taken (first-rec route-log) (main (rest-of-records route-log))))))
