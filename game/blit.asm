; #########################################################################
;
;   blit.asm - Assembly file for EECS205 Assignment 2
;
;
; #########################################################################

      .586
      .MODEL FLAT,STDCALL
      .STACK 4096
      option casemap :none  ; case sensitive

    include blit.inc		; Take a look at this file to understand how
				;      bitmaps are declared

.DATA
	;; You may declare helper variables here.
temp DWORD ?
currRow DWORD ?
currCol DWORD ?
counter DWORD ?

.CODE

; Routine which draws a bitmap to the screen
BlitReg PROC 

    ;; Here is some C-like pseudocode. You can use this as a starting point
    ;; 	 (or start from scratch if you feel like it)

    ;; Feel free to declare variables (global) if it helps. There is a pretty
    ;;   good chance that you won't fit everything in registers

    ;; 	for(bmpY = 0;  bmpY < srcBitmap->dwHeight; bmpY++)
    ;;         	for(bmpX = 0;  bmpX < srcBitmap->dwWidth; bmpX++) {
    ;; 		        screenX = centerX + bmpX - srcBitmap->dwWidth/2;
    ;; 		        screenY = centerY + bmpY - srcBitmap->dwHeight/2;
    ;; 	
    ;; 			if (srcBitmap->lpBytes[bmpY*srcBitmap->dwWidth+bmpX] == srcBitmap->bTransparent &&
    ;; 			    screenX >= 0 && screenX <= 639 &&
    ;; 			    screenY >= 0 && screenY <= 479)
    ;; 				lpDisplayBits[screenY*dwPitch + screenX] =
    ;; 					srcBitmap->lpBytes[bmpY*srcBitmap->dwWidth+bmpX]; 
    ;; 				
    ;; 		}

    mov ebx, edx            ;; save bitmap ptr by copying into ebx



    mov edx, (EECS205BITMAP PTR [ebx]).dwWidth ;;move width into edx
    shr edx, 1                         ;;shift right 1 bit (equivalent to dividing by 2)
    sub esi, edx                       ;;esi <- address for (x-dwWidth/2) 

    mov edx, (EECS205BITMAP PTR [ebx]).dwHeight   ;;move height into edx
    shr edx, 1                                   ;;shift right 1 bit (equivalent to dividing by 2)
    sub edi, edx                                 ;;edi <- address for (y-dwWidth/2) 

    
    mov eax, dwPitch                        ;; eax <- dwpitch * edi (y-dwheight/2)
    mul edi                                 ;; eax <- (dwitpitch * y-dwheight/2) + (x-dwwidth/2)
    add eax, esi
    add eax, lpDisplayBits                  ;; eax has the address for the pixel in the upper left
    
    mov counter, 0
    mov currRow, 0
L2:

    mov currCol, 0 

L1: 
    cmp esi, 0              ;; the following section checks if we need to clip the pixel on this iteration
    jl body
    cmp edi, 0
    jl body
    cmp esi, 639
    jg body
    cmp edi, 479
    jg body                 ;;end clipping check
    
    mov temp, eax                                 ;;compute the needed location in lpBytes
    mov ecx, (EECS205BITMAP PTR [ebx]).lpBytes    ;;ecx <- pointer to lpBytes
    mov eax, (EECS205BITMAP PTR [ebx]).dwWidth
    mul currRow
    add eax, currCol
    add ecx, eax                              
    mov edx, [ecx]
    mov eax, temp           ;; put address back in eax for current pixel
    
      
    cmp dl, BYTE PTR [ebx + 8]
    jz body

   mov BYTE PTR [eax], dl
    
body:   
    add esi, 1
    add eax, 1
    add currCol, 1
    mov ecx, currCol
    cmp ecx, (EECS205BITMAP PTR [ebx]).dwWidth
    jl L1                                           ;; one row

    sub esi, (EECS205BITMAP PTR [ebx]).dwWidth
    sub eax, (EECS205BITMAP PTR [ebx]).dwWidth
    add eax, dwPitch

    add edi, 1
    add currRow, 1
    mov edx, currRow
    cmp edx, (EECS205BITMAP PTR [ebx]).dwHeight
    jl L2

    
    ret             ;; Don't delete this line
    
BlitReg ENDP

.DATA
		
StarBitmap EECS205BITMAP <32, 36, 0ffh,, offset StarBitmap + sizeof StarBitmap>
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0feh
	BYTE 0feh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0feh
	BYTE 0feh,0feh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0feh,0fdh
	BYTE 0f9h,0f9h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0feh,0fdh
	BYTE 0f8h,0f8h,0fdh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0feh,0fdh
	BYTE 0f8h,0f8h,0f8h,0feh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0feh,0feh,0fdh
	BYTE 0f8h,0f8h,0d8h,0f9h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0feh,0feh,0f9h
	BYTE 0f8h,0f8h,0d8h,0d8h,0feh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0feh,0fdh,0f8h
	BYTE 0f8h,0f4h,0f8h,0d8h,0d9h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fah,0feh,0fdh,0f8h
	BYTE 0f8h,0f4h,0f8h,0d8h,0d8h,0fdh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0feh,0feh,0fdh,0f8h
	BYTE 0f4h,0f4h,0f4h,0f8h,0f8h,0d4h,0feh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0feh,0feh,0feh,0f9h,0d4h
	BYTE 0f8h,0f4h,0f4h,0d4h,0f8h,0f8h,0d4h,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0feh,0feh,0f9h,0fdh,0f8h,0f8h
	BYTE 0f4h,0f8h,0f4h,0f4h,0f8h,0d4h,0d4h,0f8h,0d9h,0d9h,0d9h,0f9h,0d9h,0f9h,0d9h,0fah
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0feh,0feh,0fdh,0f9h,0f8h,0f8h,0f8h,0f8h
	BYTE 0f8h,0d4h,0f8h,0f8h,0f4h,0f8h,0f8h,0d8h,0f8h,0f8h,0f8h,0f8h,0d8h,0d4h,0d5h,0feh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0feh,0feh,0feh,0f9h,0f9h,0f8h,0f8h,0fch,0fch,0f8h,0f8h
	BYTE 0f8h,0f8h,0f8h,0f8h,0f4h,0f8h,0b0h,0d8h,0d8h,0f8h,0f8h,0f4h,0f8h,0d8h,0d9h,0feh
	BYTE 0ffh,0ffh,0feh,0fdh,0f9h,0f8h,0f8h,0f8h,0f8h,0f8h,0fdh,0fdh,0f8h,0f8h,0f8h,0f8h
	BYTE 0f8h,0b0h,0d8h,0f8h,0f8h,0f8h,044h,08ch,0d4h,0d8h,0d4h,0d4h,0d4h,0d4h,0feh,0ffh
	BYTE 0feh,0feh,0d9h,0d8h,0f8h,0f8h,0fch,0fch,0f8h,0f8h,0f8h,0f8h,0f8h,0f8h,0f8h,0fch
	BYTE 0f8h,06ch,06ch,0fch,0f8h,0d8h,06ch,06ch,0d4h,0f8h,0d4h,0d4h,0d4h,0d5h,0ffh,0ffh
	BYTE 0ffh,0dah,0d4h,0d4h,0f8h,0f8h,0f8h,0f8h,0f4h,0f4h,0f4h,0f8h,0f8h,0f8h,0fch,0fch
	BYTE 0fdh,06ch,06ch,0fdh,0fch,0d8h,048h,068h,0f8h,0d4h,0d4h,0d4h,0d4h,0feh,0ffh,0ffh
	BYTE 0ffh,0ffh,0feh,0d8h,0d4h,0f4h,0f8h,0f4h,0f4h,0f4h,0f8h,0f8h,0f8h,0f8h,0fch,0fch
	BYTE 0fdh,048h,048h,0fdh,0fch,0fch,044h,024h,0f8h,0d4h,0d4h,0d4h,0d9h,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0feh,0f9h,0f8h,0f8h,0f8h,0f8h,0f8h,0f8h,0f8h,0f8h,0fch,0fch,0fch
	BYTE 0fdh,048h,000h,0fdh,0fch,0f8h,048h,024h,0f8h,0f4h,0d4h,0d5h,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0feh,0f9h,0f8h,0f8h,0d8h,0f8h,0f8h,0f8h,0f8h,0fch,0fch,0fch
	BYTE 0fch,06ch,020h,0f8h,0fch,0fch,090h,044h,0f8h,0f4h,0d4h,0fah,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fdh,0f9h,0d8h,0d8h,0f8h,0f8h,0f8h,0fch,0fch,0fch
	BYTE 0fch,0b4h,020h,0fdh,0fch,0fch,0d8h,0d8h,0f8h,0f4h,0d5h,0feh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0feh,0f9h,0d8h,0f8h,0f8h,0f8h,0fch,0fch,0fch
	BYTE 0fch,0fch,0fch,0fch,0fch,0fch,0f8h,0d8h,0f8h,0f4h,0d5h,0feh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0feh,0f9h,0f8h,0f8h,0f8h,0fch,0fch,0fch
	BYTE 0fch,0fch,0fch,0fch,0fch,0fch,0fch,0d8h,0f8h,0d4h,0d4h,0feh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0feh,0f8h,0f8h,0f8h,0f8h,0fch,0fch
	BYTE 0fch,0fch,0fch,0fch,0fch,0f8h,0f8h,0d8h,0f8h,0d4h,0d4h,0feh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0feh,0f8h,0f8h,0f8h,0f8h,0f8h,0fch
	BYTE 0fch,0fch,0fch,0fch,0f8h,0f8h,0f8h,0d8h,0d4h,0d4h,0d4h,0feh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0feh,0f8h,0f8h,0f8h,0f8h,0f8h,0f8h
	BYTE 0f8h,0fch,0f8h,0f8h,0f8h,0f8h,0d8h,0f8h,0f4h,0d4h,0d4h,0f9h,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0feh,0f8h,0f8h,0f4h,0f8h,0f8h,0f8h
	BYTE 0f8h,0f8h,0f8h,0f8h,0f8h,0f8h,0f8h,0d4h,0d4h,0d4h,0f4h,0f9h,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fah,0f8h,0f4h,0f4h,0f8h,0f8h,0f8h
	BYTE 0f8h,0f8h,0f8h,0f8h,0d4h,0d4h,0d4h,0d4h,0d4h,0d4h,0d4h,0d5h,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fah,0f8h,0f4h,0f4h,0f4h,0f4h,0d4h
	BYTE 0d4h,0d8h,0d4h,0f9h,0f9h,0d5h,0b0h,0d4h,0d4h,0d4h,0d4h,0d4h,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0f9h,0f8h,0f4h,0f4h,0f4h,0d4h,0d4h
	BYTE 0d8h,0d4h,0feh,0ffh,0ffh,0ffh,0feh,0d5h,0d5h,0d4h,0d4h,0d5h,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0f9h,0f8h,0f4h,0f4h,0f4h,0d4h,0d8h
	BYTE 0d5h,0feh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fah,0d5h,0b5h,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0f9h,0f4h,0f4h,0f4h,0d4h,0d4h,0f9h
	BYTE 0feh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0d9h,0d8h,0d4h,0d4h,0d5h,0fah,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fah,0d4h,0d4h,0d5h,0feh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0dah,0d5h,0d4h,0feh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0feh,0f9h,0feh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
		

END
