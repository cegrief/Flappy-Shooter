; #########################################################################
;
;   trig.asm - Assembly file for EECS205 Assignment 3
;
;
; #########################################################################

      .586
      .MODEL FLAT,STDCALL
      .STACK 4096
      option casemap :none  ; case sensitive

    include trig.inc	

.DATA

;;  These are some useful constants (fixed point values that correspond to important angles)
PI_HALF = 102943           	;;  PI / 2
PI =  205887	                ;;  PI 
TWO_PI	= 411774                ;;  2 * PI 
PI_INC_RECIP =  5340353        	;;  256 / PI   (use this to find the table entry for a given angle
	                        ;;              it is easier to use than divison would be)

.CODE

;; Define the functions FixedSin and FixedCos
;; Since we have thoroughly covered defining functions in class, its up to you from here on out...
;; Remember to include the 'ret' instruction or your program will hang
;; Also, don't forget to set your return values
	

FixedSin PROC STDCALL USES ecx edx esi ebx dwAngle:FIXED
LOCAL myAngle:FIXED, piFlag:DWORD

mov ebx, dwAngle
mov myAngle, ebx

cmp myAngle, 0
jge angles

add myAngle, TWO_PI
INVOKE FixedSin, myAngle
ret        

angles:

    cmp myAngle, PI_HALF
    jl body

    cmp myAngle, PI_HALF
    je pi_half

    cmp myAngle, PI
    jl between
    
    mov eax, PI
    sub myAngle, eax
    INVOKE FixedSin, myAngle
    xor ecx, ecx
    sub ecx, eax
    mov eax, ecx
    ret


pi_half:        ;; only actually applies when angle is exactly 0 for cosine
    mov eax, 1
    shl eax, 16
    ret

between:
    mov eax, PI
    sub eax, myAngle
    INVOKE FixedSin, eax 
    ret


body:

    mov eax, PI_INC_RECIP
    imul myAngle
    movzx eax, WORD PTR [SINTAB + 2 * edx]
    ret
     
FixedSin ENDP

FixedCos PROC STDCALL dwAngle:FIXED
    add dwAngle, PI_HALF
    INVOKE FixedSin, dwAngle
    ret
FixedCos ENDP
	
END
