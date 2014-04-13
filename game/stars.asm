; #########################################################################
;
;   stars.asm - Assembly file for EECS205 Assignment 1
;
;
; #########################################################################

      .586
      .MODEL FLAT,STDCALL
      .STACK 4096
      option casemap :none  ; case sensitive

    include stars.inc

.CODE

; Routine which uses DrawStarReg to create all the stars
DrawAllStars PROC 

    ;; Place your code here
    ;; antennae
    mov esi, 100
    mov edi, 100
    call DrawStarReg

    mov esi, 101
    mov edi, 101
    call DrawStarReg
    
    mov esi, 105    
    mov edi, 101
    call DrawStarReg

    mov esi, 106
    mov edi, 100
    call DrawStarReg

    ;;head
    mov esi, 100
    mov edi, 102
    call DrawStarReg

    mov esi, 101
    mov edi, 102
    call DrawStarReg

    mov esi, 102
    mov edi, 102
    call DrawStarReg

    mov esi, 103
    mov edi, 102
    call DrawStarReg

    mov esi, 104
    mov edi, 102
    call DrawStarReg

    mov esi, 105
    mov edi, 102
    call DrawStarReg

    mov esi, 106
    mov edi, 102
    call DrawStarReg

    mov esi, 99 
    mov edi, 103
    call DrawStarReg

    mov esi, 100
    mov edi, 103
    call DrawStarReg

    mov esi, 102
    mov edi, 103
    call DrawStarReg

    mov esi, 103
    mov edi, 103
    call DrawStarReg

    mov esi, 104
    mov edi, 103
    call DrawStarReg

    mov esi, 106
    mov edi, 103
    call DrawStarReg

    mov esi, 107
    mov edi, 103
    call DrawStarReg

    mov esi, 98
    mov edi, 104
    call DrawStarReg

    mov esi, 99
    mov edi, 104
    call DrawStarReg

    mov esi, 100
    mov edi, 104
    call DrawStarReg

    mov esi, 101
    mov edi, 104
    call DrawStarReg

    mov esi, 102
    mov edi, 104
    call DrawStarReg

    mov esi, 103
    mov edi, 104
    call DrawStarReg

    mov esi, 104
    mov edi, 104
    call DrawStarReg

    mov esi, 105
    mov edi, 104
    call DrawStarReg

    mov esi, 106
    mov edi, 104
    call DrawStarReg

    mov esi, 107
    mov edi, 104
    call DrawStarReg

    mov esi, 108
    mov edi, 104
    call DrawStarReg

    mov esi, 98
    mov edi, 105
    call DrawStarReg  

    mov esi, 100
    mov edi, 105
    call DrawStarReg 

    mov esi, 101
    mov edi, 105
    call DrawStarReg 

    mov esi, 102
    mov edi, 105
    call DrawStarReg 

    mov esi, 103
    mov edi, 105
    call DrawStarReg 

    mov esi, 104
    mov edi, 105
    call DrawStarReg 

    mov esi, 105
    mov edi, 105
    call DrawStarReg 

    mov esi, 106
    mov edi, 105
    call DrawStarReg 

    mov esi, 108
    mov edi, 105
    call DrawStarReg

    mov esi, 98
    mov edi, 106
    call DrawStarReg 

    mov esi, 100
    mov edi, 106
    call DrawStarReg 

    mov esi, 106
    mov edi, 106
    call DrawStarReg 

    mov esi, 108
    mov edi, 106
    call DrawStarReg    

    mov esi, 101
    mov edi, 107
    call DrawStarReg 

    mov esi, 102
    mov edi, 107
    call DrawStarReg 

    mov esi, 104
    mov edi, 107
    call DrawStarReg 

    mov esi, 105
    mov edi, 107
    call DrawStarReg

    ;; invader 2
    ;; antennae
    mov esi, 200
    mov edi, 100
    call DrawStarReg

    mov esi, 201
    mov edi, 101
    call DrawStarReg
    
    mov esi, 205    
    mov edi, 101
    call DrawStarReg

    mov esi, 206
    mov edi, 100
    call DrawStarReg

    ;; top of head
    mov esi, 200
    mov edi, 102
    call DrawStarReg

    mov esi, 201
    mov edi, 102
    call DrawStarReg

    mov esi, 202
    mov edi, 102
    call DrawStarReg

    mov esi, 203
    mov edi, 102
    call DrawStarReg

    mov esi, 204
    mov edi, 102
    call DrawStarReg

    mov esi, 205
    mov edi, 102
    call DrawStarReg

    mov esi, 206
    mov edi, 102
    call DrawStarReg

    mov esi, 199 
    mov edi, 103
    call DrawStarReg

    mov esi, 200
    mov edi, 103
    call DrawStarReg

    mov esi, 202
    mov edi, 103
    call DrawStarReg

    mov esi, 203
    mov edi, 103
    call DrawStarReg

    mov esi, 204
    mov edi, 103
    call DrawStarReg

    mov esi, 206
    mov edi, 103
    call DrawStarReg

    mov esi, 207
    mov edi, 103
    call DrawStarReg

    mov esi, 198
    mov edi, 104
    call DrawStarReg

    mov esi, 199
    mov edi, 104
    call DrawStarReg

    mov esi, 200
    mov edi, 104
    call DrawStarReg

    mov esi, 201
    mov edi, 104
    call DrawStarReg

    mov esi, 202
    mov edi, 104
    call DrawStarReg

    mov esi, 203
    mov edi, 104
    call DrawStarReg

    mov esi, 204
    mov edi, 104
    call DrawStarReg

    mov esi, 205
    mov edi, 104
    call DrawStarReg

    mov esi, 206
    mov edi, 104
    call DrawStarReg

    mov esi, 207
    mov edi, 104
    call DrawStarReg

    mov esi, 208
    mov edi, 104
    call DrawStarReg

    mov esi, 198
    mov edi, 105
    call DrawStarReg  

    mov esi, 200
    mov edi, 105
    call DrawStarReg 

    mov esi, 201
    mov edi, 105
    call DrawStarReg 

    mov esi, 202
    mov edi, 105
    call DrawStarReg 

    mov esi, 203
    mov edi, 105
    call DrawStarReg 

    mov esi, 204
    mov edi, 105
    call DrawStarReg 

    mov esi, 205
    mov edi, 105
    call DrawStarReg 

    mov esi, 206
    mov edi, 105
    call DrawStarReg 

    mov esi, 208
    mov edi, 105
    call DrawStarReg

    mov esi, 198
    mov edi, 106
    call DrawStarReg 

    mov esi, 200
    mov edi, 106
    call DrawStarReg 

    mov esi, 206
    mov edi, 106
    call DrawStarReg 

    mov esi, 208
    mov edi, 106
    call DrawStarReg    

    mov esi, 201
    mov edi, 107
    call DrawStarReg 

    mov esi, 202
    mov edi, 107
    call DrawStarReg 

    mov esi, 204
    mov edi, 107
    call DrawStarReg 

    mov esi, 205
    mov edi, 107
    call DrawStarReg


    ;; invader 3
    ;; antennae
    mov esi, 300
    mov edi, 100
    call DrawStarReg

    mov esi, 301
    mov edi, 101
    call DrawStarReg
    
    mov esi, 305    
    mov edi, 101
    call DrawStarReg

    mov esi, 306
    mov edi, 100
    call DrawStarReg

    ;; top of head
    mov esi, 300
    mov edi, 102
    call DrawStarReg

    mov esi, 301
    mov edi, 102
    call DrawStarReg

    mov esi, 302
    mov edi, 102
    call DrawStarReg

    mov esi, 303
    mov edi, 102
    call DrawStarReg

    mov esi, 304
    mov edi, 102
    call DrawStarReg

    mov esi, 305
    mov edi, 102
    call DrawStarReg

    mov esi, 306
    mov edi, 102
    call DrawStarReg

    mov esi, 299 
    mov edi, 103
    call DrawStarReg

    mov esi, 300
    mov edi, 103
    call DrawStarReg

    mov esi, 302
    mov edi, 103
    call DrawStarReg

    mov esi, 303
    mov edi, 103
    call DrawStarReg

    mov esi, 304
    mov edi, 103
    call DrawStarReg

    mov esi, 306
    mov edi, 103
    call DrawStarReg

    mov esi, 307
    mov edi, 103
    call DrawStarReg

    mov esi, 298
    mov edi, 104
    call DrawStarReg

    mov esi, 299
    mov edi, 104
    call DrawStarReg

    mov esi, 300
    mov edi, 104
    call DrawStarReg

    mov esi, 301
    mov edi, 104
    call DrawStarReg

    mov esi, 302
    mov edi, 104
    call DrawStarReg

    mov esi, 303
    mov edi, 104
    call DrawStarReg

    mov esi, 304
    mov edi, 104
    call DrawStarReg

    mov esi, 305
    mov edi, 104
    call DrawStarReg

    mov esi, 306
    mov edi, 104
    call DrawStarReg

    mov esi, 307
    mov edi, 104
    call DrawStarReg

    mov esi, 308
    mov edi, 104
    call DrawStarReg

    mov esi, 298
    mov edi, 105
    call DrawStarReg  

    mov esi, 300
    mov edi, 105
    call DrawStarReg 

    mov esi, 301
    mov edi, 105
    call DrawStarReg 

    mov esi, 302
    mov edi, 105
    call DrawStarReg 

    mov esi, 303
    mov edi, 105
    call DrawStarReg 

    mov esi, 304
    mov edi, 105
    call DrawStarReg 

    mov esi, 305
    mov edi, 105
    call DrawStarReg 

    mov esi, 306
    mov edi, 105
    call DrawStarReg 

    mov esi, 308
    mov edi, 105
    call DrawStarReg

    mov esi, 298
    mov edi, 106
    call DrawStarReg 

    mov esi, 300
    mov edi, 106
    call DrawStarReg 

    mov esi, 306
    mov edi, 106
    call DrawStarReg 

    mov esi, 308
    mov edi, 106
    call DrawStarReg    

    mov esi, 301
    mov edi, 107
    call DrawStarReg 

    mov esi, 302
    mov edi, 107
    call DrawStarReg 

    mov esi, 304
    mov edi, 107
    call DrawStarReg 

    mov esi, 305
    mov edi, 107
    call DrawStarReg


    ;; invader 4
    ;; antennae
    mov esi, 400
    mov edi, 100
    call DrawStarReg

    mov esi, 401
    mov edi, 101
    call DrawStarReg
    
    mov esi, 405    
    mov edi, 101
    call DrawStarReg

    mov esi, 406
    mov edi, 100
    call DrawStarReg

    ;; top of head
    mov esi, 400
    mov edi, 102
    call DrawStarReg

    mov esi, 401
    mov edi, 102
    call DrawStarReg

    mov esi, 402
    mov edi, 102
    call DrawStarReg

    mov esi, 403
    mov edi, 102
    call DrawStarReg

    mov esi, 404
    mov edi, 102
    call DrawStarReg

    mov esi, 405
    mov edi, 102
    call DrawStarReg

    mov esi, 406
    mov edi, 102
    call DrawStarReg

    mov esi, 399 
    mov edi, 103
    call DrawStarReg

    mov esi, 400
    mov edi, 103
    call DrawStarReg

    mov esi, 402
    mov edi, 103
    call DrawStarReg

    mov esi, 403
    mov edi, 103
    call DrawStarReg

    mov esi, 404
    mov edi, 103
    call DrawStarReg

    mov esi, 406
    mov edi, 103
    call DrawStarReg

    mov esi, 407
    mov edi, 103
    call DrawStarReg

    mov esi, 398
    mov edi, 104
    call DrawStarReg

    mov esi, 399
    mov edi, 104
    call DrawStarReg

    mov esi, 400
    mov edi, 104
    call DrawStarReg

    mov esi, 401
    mov edi, 104
    call DrawStarReg

    mov esi, 402
    mov edi, 104
    call DrawStarReg

    mov esi, 403
    mov edi, 104
    call DrawStarReg

    mov esi, 404
    mov edi, 104
    call DrawStarReg

    mov esi, 405
    mov edi, 104
    call DrawStarReg

    mov esi, 406
    mov edi, 104
    call DrawStarReg

    mov esi, 407
    mov edi, 104
    call DrawStarReg

    mov esi, 408
    mov edi, 104
    call DrawStarReg

    mov esi, 398
    mov edi, 105
    call DrawStarReg  

    mov esi, 400
    mov edi, 105
    call DrawStarReg 

    mov esi, 401
    mov edi, 105
    call DrawStarReg 

    mov esi, 402
    mov edi, 105
    call DrawStarReg 

    mov esi, 403
    mov edi, 105
    call DrawStarReg 

    mov esi, 404
    mov edi, 105
    call DrawStarReg 

    mov esi, 405
    mov edi, 105
    call DrawStarReg 

    mov esi, 406
    mov edi, 105
    call DrawStarReg 

    mov esi, 408
    mov edi, 105
    call DrawStarReg

    mov esi, 398
    mov edi, 106
    call DrawStarReg 

    mov esi, 400
    mov edi, 106
    call DrawStarReg 

    mov esi, 406
    mov edi, 106
    call DrawStarReg 

    mov esi, 408
    mov edi, 106
    call DrawStarReg    

    mov esi, 401
    mov edi, 107
    call DrawStarReg 

    mov esi, 402
    mov edi, 107
    call DrawStarReg 

    mov esi, 404
    mov edi, 107
    call DrawStarReg 

    mov esi, 405
    mov edi, 107
    call DrawStarReg

    ;;invader 5
    ;; antennae

    mov esi, 500
    mov edi, 100
    call DrawStarReg

    mov esi, 501
    mov edi, 101
    call DrawStarReg
    
    mov esi, 505    
    mov edi, 101
    call DrawStarReg

    mov esi, 506
    mov edi, 100
    call DrawStarReg

    ;; top of head
    mov esi, 500
    mov edi, 102
    call DrawStarReg

    mov esi, 501
    mov edi, 102
    call DrawStarReg

    mov esi, 502
    mov edi, 102
    call DrawStarReg

    mov esi, 503
    mov edi, 102
    call DrawStarReg

    mov esi, 504
    mov edi, 102
    call DrawStarReg

    mov esi, 505
    mov edi, 102
    call DrawStarReg

    mov esi, 506
    mov edi, 102
    call DrawStarReg

    mov esi, 499 
    mov edi, 103
    call DrawStarReg

    mov esi, 500
    mov edi, 103
    call DrawStarReg

    mov esi, 502
    mov edi, 103
    call DrawStarReg

    mov esi, 503
    mov edi, 103
    call DrawStarReg

    mov esi, 504
    mov edi, 103
    call DrawStarReg

    mov esi, 506
    mov edi, 103
    call DrawStarReg

    mov esi, 507
    mov edi, 103
    call DrawStarReg

    mov esi, 498
    mov edi, 104
    call DrawStarReg

    mov esi, 499
    mov edi, 104
    call DrawStarReg

    mov esi, 500
    mov edi, 104
    call DrawStarReg

    mov esi, 501
    mov edi, 104
    call DrawStarReg

    mov esi, 502
    mov edi, 104
    call DrawStarReg

    mov esi, 503
    mov edi, 104
    call DrawStarReg

    mov esi, 504
    mov edi, 104
    call DrawStarReg

    mov esi, 505
    mov edi, 104
    call DrawStarReg

    mov esi, 506
    mov edi, 104
    call DrawStarReg

    mov esi, 507
    mov edi, 104
    call DrawStarReg

    mov esi, 508
    mov edi, 104
    call DrawStarReg

    mov esi, 498
    mov edi, 105
    call DrawStarReg  

    mov esi, 500
    mov edi, 105
    call DrawStarReg 

    mov esi, 501
    mov edi, 105
    call DrawStarReg 

    mov esi, 502
    mov edi, 105
    call DrawStarReg 

    mov esi, 503
    mov edi, 105
    call DrawStarReg 

    mov esi, 504
    mov edi, 105
    call DrawStarReg 

    mov esi, 505
    mov edi, 105
    call DrawStarReg 

    mov esi, 506
    mov edi, 105
    call DrawStarReg 

    mov esi, 508
    mov edi, 105
    call DrawStarReg

    mov esi, 498
    mov edi, 106
    call DrawStarReg 

    mov esi, 500
    mov edi, 106
    call DrawStarReg 

    mov esi, 506
    mov edi, 106
    call DrawStarReg 

    mov esi, 508
    mov edi, 106
    call DrawStarReg    

    mov esi, 501
    mov edi, 107
    call DrawStarReg 

    mov esi, 502
    mov edi, 107
    call DrawStarReg 

    mov esi, 504
    mov edi, 107
    call DrawStarReg 

    mov esi, 505
    mov edi, 107
    call DrawStarReg
           

    ;; invader 6
    ;; antennae

    mov esi, 600
    mov edi, 100
    call DrawStarReg

    mov esi, 601
    mov edi, 101
    call DrawStarReg
    
    mov esi, 605    
    mov edi, 101
    call DrawStarReg

    mov esi, 606
    mov edi, 100
    call DrawStarReg

    ;; top of head
    mov esi, 600
    mov edi, 102
    call DrawStarReg

    mov esi, 601
    mov edi, 102
    call DrawStarReg

    mov esi, 602
    mov edi, 102
    call DrawStarReg

    mov esi, 603
    mov edi, 102
    call DrawStarReg

    mov esi, 604
    mov edi, 102
    call DrawStarReg

    mov esi, 605
    mov edi, 102
    call DrawStarReg

    mov esi, 606
    mov edi, 102
    call DrawStarReg

    mov esi, 599 
    mov edi, 103
    call DrawStarReg

    mov esi, 600
    mov edi, 103
    call DrawStarReg

    mov esi, 602
    mov edi, 103
    call DrawStarReg

    mov esi, 603
    mov edi, 103
    call DrawStarReg

    mov esi, 604
    mov edi, 103
    call DrawStarReg

    mov esi, 606
    mov edi, 103
    call DrawStarReg

    mov esi, 607
    mov edi, 103
    call DrawStarReg

    mov esi, 598
    mov edi, 104
    call DrawStarReg

    mov esi, 599
    mov edi, 104
    call DrawStarReg

    mov esi, 600
    mov edi, 104
    call DrawStarReg

    mov esi, 601
    mov edi, 104
    call DrawStarReg

    mov esi, 602
    mov edi, 104
    call DrawStarReg

    mov esi, 603
    mov edi, 104
    call DrawStarReg

    mov esi, 604
    mov edi, 104
    call DrawStarReg

    mov esi, 605
    mov edi, 104
    call DrawStarReg

    mov esi, 606
    mov edi, 104
    call DrawStarReg

    mov esi, 607
    mov edi, 104
    call DrawStarReg

    mov esi, 608
    mov edi, 104
    call DrawStarReg

    mov esi, 598
    mov edi, 105
    call DrawStarReg  

    mov esi, 600
    mov edi, 105
    call DrawStarReg 

    mov esi, 601
    mov edi, 105
    call DrawStarReg 

    mov esi, 602
    mov edi, 105
    call DrawStarReg 

    mov esi, 603
    mov edi, 105
    call DrawStarReg 

    mov esi, 604
    mov edi, 105
    call DrawStarReg 

    mov esi, 605
    mov edi, 105
    call DrawStarReg 

    mov esi, 606
    mov edi, 105
    call DrawStarReg 

    mov esi, 608
    mov edi, 105
    call DrawStarReg

    mov esi, 598
    mov edi, 106
    call DrawStarReg 

    mov esi, 600
    mov edi, 106
    call DrawStarReg 

    mov esi, 606
    mov edi, 106
    call DrawStarReg 

    mov esi, 608
    mov edi, 106
    call DrawStarReg    

    mov esi, 601
    mov edi, 107
    call DrawStarReg 

    mov esi, 602
    mov edi, 107
    call DrawStarReg 

    mov esi, 604
    mov edi, 107
    call DrawStarReg 

    mov esi, 605
    mov edi, 107
    call DrawStarReg
           

    ;;invader 7
    ;; antennae

    mov esi, 2
    mov edi, 100
    call DrawStarReg

    mov esi, 3
    mov edi, 101
    call DrawStarReg
    
    mov esi, 7    
    mov edi, 101
    call DrawStarReg

    mov esi, 8
    mov edi, 100
    call DrawStarReg

    ;; top of head
    mov esi, 2
    mov edi, 102
    call DrawStarReg

    mov esi, 3
    mov edi, 102
    call DrawStarReg

    mov esi, 4
    mov edi, 102
    call DrawStarReg

    mov esi, 5
    mov edi, 102
    call DrawStarReg

    mov esi, 6
    mov edi, 102
    call DrawStarReg

    mov esi, 7
    mov edi, 102
    call DrawStarReg

    mov esi, 8
    mov edi, 102
    call DrawStarReg

    mov esi,  1 
    mov edi, 103
    call DrawStarReg

    mov esi, 2
    mov edi, 103
    call DrawStarReg

    mov esi, 4
    mov edi, 103
    call DrawStarReg

    mov esi, 5
    mov edi, 103
    call DrawStarReg

    mov esi, 6
    mov edi, 103
    call DrawStarReg

    mov esi, 8
    mov edi, 103
    call DrawStarReg

    mov esi, 9
    mov edi, 103
    call DrawStarReg

    mov esi,  0
    mov edi, 104
    call DrawStarReg

    mov esi,  1
    mov edi, 104
    call DrawStarReg

    mov esi, 2
    mov edi, 104
    call DrawStarReg

    mov esi, 3
    mov edi, 104
    call DrawStarReg

    mov esi, 4
    mov edi, 104
    call DrawStarReg

    mov esi, 5
    mov edi, 104
    call DrawStarReg

    mov esi, 6
    mov edi, 104
    call DrawStarReg

    mov esi, 7
    mov edi, 104
    call DrawStarReg

    mov esi, 8
    mov edi, 104
    call DrawStarReg

    mov esi, 9
    mov edi, 104
    call DrawStarReg

    mov esi, 10
    mov edi, 104
    call DrawStarReg

    mov esi, 0
    mov edi, 105
    call DrawStarReg  

    mov esi, 2
    mov edi, 105
    call DrawStarReg 

    mov esi, 3
    mov edi, 105
    call DrawStarReg 

    mov esi, 4
    mov edi, 105
    call DrawStarReg 

    mov esi, 5
    mov edi, 105
    call DrawStarReg 

    mov esi, 6
    mov edi, 105
    call DrawStarReg 

    mov esi, 7
    mov edi, 105
    call DrawStarReg 

    mov esi, 8
    mov edi, 105
    call DrawStarReg 

    mov esi, 10
    mov edi, 105
    call DrawStarReg

    mov esi, 0
    mov edi, 106
    call DrawStarReg 

    mov esi, 2
    mov edi, 106
    call DrawStarReg 

    mov esi, 8
    mov edi, 106
    call DrawStarReg 

    mov esi, 10
    mov edi, 106
    call DrawStarReg    

    mov esi, 3
    mov edi, 107
    call DrawStarReg 

    mov esi, 4
    mov edi, 107
    call DrawStarReg 

    mov esi, 6
    mov edi, 107
    call DrawStarReg 

    mov esi, 7
    mov edi, 107
    call DrawStarReg

    ret             ;; Don't delete this line
    
DrawAllStars ENDP

END
