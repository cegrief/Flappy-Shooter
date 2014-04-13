; #########################################################################
;
;   rotate.asm - Assembly file for EECS205 Assignment 3
;
;
; #########################################################################

      .586
      .MODEL FLAT,STDCALL
      .STACK 4096
      option casemap :none  ; case sensitive

    include trig.inc		; Useful prototypes
    include rotate.inc		; 	and definitions

.DATA
	;; You may declare helper variables here, but it would probably be better to use local variables

.CODE


;; Define the functions BasicBlit and RotateBlit
;; Take a look at rotate.inc for the correct prototypes (if you don't follow these precisely, you'll get errors)
;; Since we have thoroughly covered defining functions in class, its up to you from here on out...
;; Remember to include the 'ret' instruction or your program will hang
BasicBlit PROC STDCALL USES edx esi edi lpBmp:PTR EECS205BITMAP, xcenter:DWORD, ycenter:DWORD 
    mov edx, lpBmp 
    mov esi, xcenter 
    mov edi, ycenter 
    INVOKE BlitReg 
    ret 
BasicBlit ENDP 


RotateBlit PROC STDCALL USES esi edi edx lpBmp:PTR EECS205BITMAP, xcenter:DWORD, ycenter:DWORD, angle:DWORD 
    LOCAL cosa:FIXED 
    LOCAL sina:FIXED 
    LOCAL shiftX:DWORD 
    LOCAL shiftY:DWORD 
    LOCAL dstWidth:DWORD 
    LOCAL dstHeight:DWORD
    LOCAL dstX:DWORD
    LOCAL dstY:DWORD 
    LOCAL srcX:DWORD
    LOCAL srcY:DWORD
    LOCAL yPos:DWORD
    LOCAL xPos:DWORD 
    LOCAL lpBmpRef:BYTE                ;;lpBytes[srcY*dwWidth +srcX]

    INVOKE FixedCos, angle 
    mov cosa, eax

    mov sina, 0
    INVOKE FixedSin, angle
    sub sina, eax                           ;; I do this to make hitting the left arrow key rotate ccw instead of cw, which makes more sense. By default using the positive sin value makes it rotate cw
                                            ;; 

    mov esi, lpBmp

;; shiftX calculations

    mov edi, (EECS205BITMAP PTR [esi]).dwWidth
    shr edi, 1
    INVOKE FixedMul, cosa, edi
    mov shiftX, eax

    mov edx, (EECS205BITMAP PTR [esi]).dwHeight
    shr edx, 1
    INVOKE FixedMul, sina, edx
    sub shiftX, eax

;;shiftY calcs
    mov edi, (EECS205BITMAP PTR [esi]).dwHeight
    shr edi, 1
    INVOKE FixedMul, cosa, edi
    mov shiftY, eax

    mov edx, (EECS205BITMAP PTR [esi]).dwWidth
    shr edx, 1
    INVOKE FixedMul, sina, edx
    add shiftY, eax

;;dstWidth/height
    mov eax, (EECS205BITMAP PTR [esi]).dwWidth
    add eax, (EECS205BITMAP PTR [esi]).dwHeight
    mov dstWidth, eax
    mov dstHeight, eax


    xor edx, edx
    sub edx, dstWidth
    mov dstX, edx


    xor ecx, ecx
    sub ecx, dstHeight
    mov dstY, ecx
    
L1:
    ;;srcX calc
    INVOKE FixedMul, dstX, cosa
    mov srcX, eax

    INVOKE FixedMul, dstY, sina
    add srcX, eax

    ;;srcY calc
    INVOKE FixedMul, dstY, cosa
    mov srcY, eax

    INVOKE FixedMul, dstX, sina
    sub srcY, eax

    cmp srcX, 0
    jl l1checks

    mov eax, (EECS205BITMAP PTR [esi]).dwWidth
    cmp srcX, eax
    jge l1checks

    cmp srcY, 0
    jl l1checks

    mov eax, (EECS205BITMAP PTR [esi]).dwHeight
    cmp srcY, eax
    jge l1checks

    mov eax, xcenter
    add eax, dstX
    sub eax, shiftX
    mov xPos, eax
    
    cmp xPos, 0
    jl l1checks
    cmp xPos, 639
    jge l1checks

    mov eax, ycenter
    add eax, dstY
    sub eax, shiftY
    mov yPos, eax
    
    cmp yPos, 0
    jl l1checks
    cmp yPos, 479
    jge l1checks
    
;;check for transparency
    mov edi, (EECS205BITMAP PTR [esi]).lpBytes
    mov eax, (EECS205BITMAP PTR [esi]).dwWidth
    imul srcY
    add eax, srcX
    add edi, eax
    mov eax, [edi]
    cmp al, (EECS205BITMAP PTR [esi]).bTransparent
    je l1checks

    mov lpBmpRef, al

    mov eax, yPos
    imul dwPitch
    add eax, xPos
    add eax, lpDisplayBits
    mov cl, lpBmpRef
    mov [eax], cl

l1checks:

    inc dstY
    mov eax, dstY
    cmp eax, dstHeight
    jl L1

    inc dstX
    xor edx, edx
    sub edx, dstWidth
    mov dstY, edx
    mov eax, dstX
    cmp eax, dstWidth
    jl L1

    ret
RotateBlit ENDP

FixedMul PROC USES edx, x:DWORD, y:DWORD
	mov eax, x					
	imul y						
	shr eax, 16
	shl edx, 16
	or eax, edx
	ret
FixedMul	ENDP





END		


