; #########################################################################
;
;   logic.asm - Assembly file for EECS205 Assignment 4/5
;
;
; #########################################################################

      .586
      .MODEL FLAT,STDCALL
      .STACK 4096
      option casemap :none  ; case sensitive
      
    include stars.inc	
    include blit.inc
    include rotate.inc
    include game.inc
    include keys.inc
    include trig.inc

	
.DATA

bird Sprite <320, 240, 20971520, 15728640, 0, 0, 0, 0, 10>
pipe Sprite <600, 100, ?, ?, ?, ?, 0, 0, 0>
downPipe Sprite <600, 400, ?, ?, ?, ?, 0, 0, 0>
poke Sprite<1000, 1000, ?, ?, 400000, ?, 0, 1, 100>
abby Sprite<500, 200, ?, ?, ?, ?, 0, 0, 1000>
electrode Sprite<1000, 1000, ?, ?, ?, ?, 0, 1, 0>
zapdos Sprite<1000, 1000, ?, ?, ?, ?, 0, 1, 100000>
venomoth Sprite<1000, 1000, ?, ?, ?, ?, 0, 1, 10000>
omanyte Sprite<1000, 1000, ?, ?, ?, ?, 0, 1, 100000>
omastar Sprite<1000, 1000, ?, ?, ?, ?, 0, 1, 100000>
currEnemy Sprite <?, ?, ?, ?, ?, ?, ?, ?, ?>

mouseX DWORD ?
mouseY DWORD ?
randomSeed DWORD ?
level DWORD 1
gameOverMessage BYTE "Game Over", 0
restartMessage BYTE "Press R to try again!", 0
godMessage BYTE "God Mode enabled", 0
godMode DWORD 0
gravity DWORD 60000

.CODE

;; Define the function GameLogic
;; Since we have thoroughly covered defining functions in class, its up to you from here on out...

;;xinc is mouse status, yinc is keyboard status
GameLogic PROC xinc:DWORD, yinc:DWORD

cmp yinc, VK_G
jne checkgodmode
xor godMode, 1



checkgodmode:
cmp godMode, 1
jne checkgameover
INVOKE DrawString, 250, 50, ADDR godMessage
mov bird.hp, 99999999
mov points, 99999999
mov poke.hp, 999999
cmp yinc, VK_R
jne checklevelshift
INVOKE GameInit

checklevelshift:
cmp yinc, VK_L
jne checkgameover
inc level
INVOKE levelShift

checkgameover:
cmp bird.hp, 0
jg nogameover
INVOKE DrawString, 250, 175, ADDR gameOverMessage
INVOKE DrawString, 250, 200, ADDR restartMessage

cmp yinc, VK_R
jne endgameover
INVOKE GameInit

endgameover:

cmp pipe.xVel, 0
jge nogameover
add pipe.xVel, 100000
add downPipe.xVel, 100000
jmp nogameover

nogameover:

mov eax, pipe.xVel
add pipe.xPosFixed, eax


mov eax, downPipe.xVel
add downPipe.xPosFixed, eax

cmp downPipe.xPos, 0
jge flappy

mov downPipe.xPos, 640
mov ebx, 640
shl ebx, 16
mov downPipe.xPosFixed, ebx

mov ebx, -75
shl ebx, 16
mov downPipe.yPosFixed, ebx

mov pipe.xPos, 640
mov ebx, 640
shl ebx, 16
mov pipe.xPosFixed, ebx

mov ebx, 500
shl ebx, 16
mov pipe.yPosFixed, ebx
add points, 100

INVOKE RandomNum
sar eax, 8
add pipe.yPosFixed, eax
add downPipe.yPosFixed, eax
mov ebx, pipe.yPosFixed
shr ebx, 16
mov pipe.yPos, ebx

mov ebx, downPipe.yPosFixed
shr ebx, 16
mov downPipe.yPos, ebx



flappy:

cmp bird.hp, 0
jle nospace

cmp yinc, VK_SPACE
jne nospace

mov bird.yVel, 800000
mov bird.angle, 50000

nospace:

mov eax, bird.yVel
sub bird.yPosFixed, eax
mov eax, gravity
sub bird.yVel, eax

mov ecx, bird.angle
cmp ecx, -75000
jle bottom
sub bird.angle, 4000

bottom:
mov ebx, bird.yPosFixed
shr ebx, 16
mov ebx, bird.yPos
cmp bird.yPos, 420
jge ground
cmp bird.yPos, 0
jge birdCol

mov bird.yPosFixed, 0
jmp birdCol

ground:
mov bird.yVel, 0
mov bird.hp, 0

birdCol:            ;;check if the bird has hit a pipe

mov eax, bird.xPos
add eax, 50

mov ebx, bird.yPos
add ebx, 220

cmp pipe.xPos, eax
jg birdnocol

sub eax, 100
cmp pipe.xPos, eax
jl birdnocol

cmp pipe.yPos, ebx
jl birdcollide

sub ebx, 440

cmp downPipe.yPos, ebx
jl birdnocol

birdcollide:

mov eax, level
sub bird.hp, eax

birdnocol:

pokeball:
cmp poke.visible, 0
je movPoke

cmp bird.hp, 0
je pokeOnScreen

and xinc, 2       
cmp xinc, 0         ;;check if the mouse button is clicked
je pokeOnScreen


mov poke.visible, 0
;;mov poke.xVel, 2000000
mov ebx, bird.xPosFixed
mov poke.xPosFixed, ebx
add poke.xPosFixed, 100000
mov ebx, bird.yPosFixed
mov poke.yPosFixed, ebx 

jmp pokeOnScreen

movPoke:

mov eax, poke.xVel
add poke.xPosFixed, eax

cmp poke.xPosFixed, 0
jl pokeoff
cmp poke.xPosFixed, 41943040
jle pokeOnScreen

pokeoff:
mov poke.visible, 1

pokeOnScreen:

cmp abby.visible, 0 ;;abby
jne endabby

mov eax, abby.yVel
add abby.yPosFixed, eax

mov ebx, abby.yPosFixed
shr ebx, 16
mov abby.yPos, ebx
cmp abby.yPos, 420
jge abbybounds
cmp abby.yPos, 0
jg abbyColCheck

abbybounds:
xor eax, eax
sub eax, abby.yVel
mov abby.yVel, eax

abbyColCheck: ;;check if a pokeball has hit abby

xor eax, eax
INVOKE CollisionCheck, ADDR poke, ADDR abby, 45
cmp eax, 1
jne abbynocollision


mov ebx, poke.xPosFixed
mov ecx, poke.yPosFixed
mov electrode.xPosFixed, ebx
mov electrode.yPosFixed, ecx
mov electrode.hp, 20
mov electrode.visible, 0

mov poke.xPosFixed, 500000000 ;;offscreen to be able to shoot again
mov poke.yPosFixed, 500000000 ;;offscreen to be able to shoot again
mov poke.xPos, 1000
mov poke.yPos, 1000
mov poke.visible, 1
mov ebx, poke.hp
sub abby.hp, ebx
sub currHP, ebx
add points, ebx

abbynocollision:
cmp abby.hp, 0
jg endabby
mov abby.visible, 1
inc level
INVOKE levelShift

endabby:

cmp venomoth.visible, 0 ;;venomoth
jne endvenomoth

mov eax, venomoth.yVel
add venomoth.yPosFixed, eax

mov ebx, venomoth.yPosFixed
shr ebx, 16
mov venomoth.yPos, ebx
cmp venomoth.yPos, 420
jge venomothbounds
cmp venomoth.yPos, 0
jg venomothColCheck

venomothbounds:
xor eax, eax
sub eax, venomoth.yVel
mov venomoth.yVel, eax

venomothColCheck: ;;check if a pokeball has hit venomoth

xor eax, eax
INVOKE CollisionCheck, ADDR poke, ADDR venomoth, 70
cmp eax, 1
jne venomothnocollision


mov ebx, poke.xPosFixed
mov ecx, poke.yPosFixed
mov electrode.xPosFixed, ebx
mov electrode.yPosFixed, ecx
mov electrode.hp, 20
mov electrode.visible, 0

mov poke.xPosFixed, 500000000 ;;offscreen to be able to shoot again
mov poke.yPosFixed, 500000000 ;;offscreen to be able to shoot again
mov poke.xPos, 1000
mov poke.yPos, 1000
mov poke.visible, 1
mov ebx, poke.hp
sub venomoth.hp, ebx
sub currHP, ebx
add points, ebx

venomothnocollision:
cmp venomoth.hp, 0
jg endvenomoth
mov venomoth.visible, 1
inc level
INVOKE levelShift

endvenomoth:

cmp omanyte.visible, 0 ;;omanyte
jne endomanyte

mov eax, omanyte.yVel
add omanyte.yPosFixed, eax

mov ebx, omanyte.yPosFixed
shr ebx, 16
mov omanyte.yPos, ebx
cmp omanyte.yPos, 420
jge omanytebounds
cmp omanyte.yPos, 0
jg omanyteColCheck

omanytebounds:
xor eax, eax
sub eax, omanyte.yVel
mov omanyte.yVel, eax

omanyteColCheck: ;;check if a pokeball has hit omanyte

xor eax, eax
INVOKE CollisionCheck, ADDR poke, ADDR omanyte, 70
cmp eax, 1
jne omanytenocollision


mov ebx, poke.xPosFixed
mov ecx, poke.yPosFixed
mov electrode.xPosFixed, ebx
mov electrode.yPosFixed, ecx
mov electrode.hp, 20
mov electrode.visible, 0

mov poke.xPosFixed, 500000000 ;;offscreen to be able to shoot again
mov poke.yPosFixed, 500000000 ;;offscreen to be able to shoot again
mov poke.xPos, 1000
mov poke.yPos, 1000
mov poke.visible, 1
mov ebx, poke.hp
sub omanyte.hp, ebx
sub currHP, ebx
add points, ebx

omanytenocollision:
cmp omanyte.hp, 0
jg endomanyte
mov omanyte.visible, 1
inc level
INVOKE levelShift

endomanyte:

cmp zapdos.visible, 0 ;;zapdos
jne endzapdos

mov eax, zapdos.yVel
add zapdos.yPosFixed, eax

mov ebx, zapdos.yPosFixed
shr ebx, 16
mov zapdos.yPos, ebx
cmp zapdos.yPos, 420
jge zapdosbounds
cmp zapdos.yPos, 0
jg zapdosColCheck

zapdosbounds:
xor eax, eax
sub eax, zapdos.yVel
mov zapdos.yVel, eax

zapdosColCheck: ;;check if a pokeball has hit zapdos

xor eax, eax
INVOKE CollisionCheck, ADDR poke, ADDR zapdos, 120
cmp eax, 1
jne zapdosnocollision


mov ebx, poke.xPosFixed
mov ecx, poke.yPosFixed
mov electrode.xPosFixed, ebx
mov electrode.yPosFixed, ecx
mov electrode.hp, 20
mov electrode.visible, 0

mov poke.xPosFixed, 500000000 ;;offscreen to be able to shoot again
mov poke.yPosFixed, 500000000 ;;offscreen to be able to shoot again
mov poke.xPos, 1000
mov poke.yPos, 1000
mov poke.visible, 1
mov ebx, poke.hp
sub zapdos.hp, ebx
sub currHP, ebx
add points, ebx

zapdosnocollision:
cmp zapdos.hp, 0
jg endzapdos
mov zapdos.visible, 1
inc level
INVOKE levelShift

endzapdos:
cmp omastar.visible, 0 ;;omastar
jne endomastar

mov eax, omastar.yVel
add omastar.yPosFixed, eax

mov ebx, omastar.yPosFixed
shr ebx, 16
mov omastar.yPos, ebx
cmp omastar.yPos, 420
jge omastarbounds
cmp omastar.yPos, 0
jg omastarColCheck

omastarbounds:
xor eax, eax
sub eax, omastar.yVel
mov omastar.yVel, eax

omastarColCheck: ;;check if a pokeball has hit omastar

xor eax, eax
INVOKE CollisionCheck, ADDR poke, ADDR omastar, 150
cmp eax, 1
jne omastarnocollision


mov ebx, poke.xPosFixed
mov ecx, poke.yPosFixed
mov electrode.xPosFixed, ebx
mov electrode.yPosFixed, ecx
mov electrode.hp, 20
mov electrode.visible, 0

mov poke.xPosFixed, 500000000 ;;offscreen to be able to shoot again
mov poke.yPosFixed, 500000000 ;;offscreen to be able to shoot again
mov poke.xPos, 1000
mov poke.yPos, 1000
mov poke.visible, 1
mov ebx, poke.hp
sub omastar.hp, ebx
sub currHP, ebx
add points, ebx

omastarnocollision:
cmp omastar.hp, 0
jg endomastar
mov omastar.visible, 1
inc level
INVOKE levelShift

endomastar:


cmp electrode.hp, 0
jg keepexploding
mov electrode.visible, 1
jmp endlogic


keepexploding:
sub electrode.hp, 1

endlogic:
ret

GameLogic ENDP

CollisionCheck PROC USES esi edi edx, obj1:PTR Sprite, obj2:PTR Sprite, tol:DWORD
mov esi, obj1
mov edi, obj2

mov eax, (Sprite PTR [esi]).xPos
sub eax, (Sprite PTR [edi]).xPos
cmp eax, 0
jg checkY
not eax

checkY:
mov edx, (Sprite PTR [esi]).yPos
sub edx, (Sprite PTR [edi]).yPos
cmp edx, 0
jg checkTol
not edx

checkTol:
add eax, edx
cmp eax, tol
jg nocollision

mov eax, 1
jmp return

nocollision:
mov eax, 0

return:

ret
CollisionCheck ENDP


RandomNum PROC
mov eax, randomSeed
add eax, 1
ror eax, 3
add eax, 0f3a14c44h
rol eax, 17
add eax, 034ah
mov randomSeed, eax
ret
RandomNum ENDP

END
