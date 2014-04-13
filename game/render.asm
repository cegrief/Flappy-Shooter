; #########################################################################
;
;   render.asm - Assembly file for EECS205 Assignment 4/5
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
    include trig.inc
	
.DATA

hpline BYTE "Enemy HP:",0
birdhpline BYTE "Bird HP:",0
pointsline BYTE "Points:", 0
pausescreen0 BYTE "PAUSED",0
pausescreen1 BYTE "UPGRADES:        COST:         CURRENT:     BUY WITH:",0
pausescreen2 BYTE "HP",0
pausescreen3 BYTE "DAMAGE",0
pausescreen4 BYTE "PROJECTILE",0
pausescreen5 BYTE "SPEED",0
directions1 BYTE "PRESS SPACE TO FLAP AND CLICK TO FIRE",0
directions2 BYTE "PRESS Z KEY TO PAUSE AND SHOP",0 
hpcost DWORD 100
dmgcost DWORD 100
spdcost DWORD 100
spdkey BYTE "E",0
hpkey BYTE "Q",0
dmgkey BYTE "W",0
youwin BYTE "CONGRATULATIONS, YOU'VE BEATEN LORD HELIX AND WON THE GAME!",0

enemyPic DWORD ?

.CODE

;; Define the function GameRender
;; Since we have thoroughly covered defining functions in class, its up to you from here on out...
GameRender PROC
INVOKE BeginDraw
INVOKE DrawAllStars
INVOKE DrawString, 450, 0, ADDR hpline
invoke DrawString, 0, 0, ADDR birdhpline
invoke DrawString, 0, 25, ADDR pointsline
invoke DrawString, 200, 400, ADDR directions1
invoke DrawString, 200, 420, ADDR directions2
invoke DrawInt, 75, 25, points

cmp pause, 1
jne sprites

INVOKE DrawString, 275, 100, ADDR pausescreen0
INVOKE DrawString, 150, 150, ADDR pausescreen1
INVOKE DrawString, 150, 200, ADDR pausescreen2
INVOKE DrawString, 150, 250, ADDR pausescreen3
INVOKE DrawString, 150, 300, ADDR pausescreen4
INVOKE DrawString, 150, 315, ADDR pausescreen5

INVOKE DrawInt, 275, 200, hpcost
INVOKE DrawInt, 275, 250, dmgcost
INVOKE DrawInt, 275, 300, spdcost

INVOKE DrawInt, 400, 200, bird.hp
INVOKE DrawInt, 400, 250, poke.hp
INVOKE DrawInt, 400, 300, poke.xVel

INVOKE DrawString, 500, 200, ADDR hpkey
INVOKE DrawString, 500, 250, ADDR dmgkey
INVOKE DrawString, 500, 300, ADDR spdkey



sprites:
cmp bird.visible, 0
jne nobird
INVOKE DrawInt, 100, 0, bird.hp
mov ebx, bird.xPosFixed
mov ecx, bird.yPosFixed
sar ebx, 16
sar ecx, 16
mov bird.xPos, ebx
mov bird.yPos, ecx
INVOKE RotateBlit, ADDR BIRD, ebx, ecx, bird.angle
nobird:

cmp pipe.visible, 0
jne noPipe
mov ebx, pipe.xPosFixed
mov ecx, pipe.yPosFixed
sar ebx, 16
sar ecx, 16
mov pipe.xPos, ebx
mov pipe.yPos, ecx
INVOKE RotateBlit, ADDR PIPE, ebx, ecx, pipe.angle
noPipe:
 
cmp downPipe.visible, 0
jne nodownPipe
mov ebx, downPipe.xPosFixed
mov ecx, downPipe.yPosFixed
sar ebx, 16
sar ecx, 16
mov downPipe.xPos, ebx
mov downPipe.yPos, ecx
INVOKE RotateBlit, ADDR DOWNPIPE, ebx, ecx, downPipe.angle
nodownPipe:

cmp poke.visible, 0
jne noPoke
mov ebx, poke.xPosFixed
mov ecx, poke.yPosFixed
sar ebx, 16
sar ecx, 16
mov poke.xPos, ebx
mov poke.yPos, ecx
INVOKE RotateBlit, OFFSET POKE, ebx, ecx, poke.angle
noPoke:


cmp abby.visible, 0
jne noabby
INVOKE DrawInt, 550, 0, currHP
mov ebx, abby.xPosFixed
mov ecx, abby.yPosFixed
sar ebx, 16
sar ecx, 16
mov abby.xPos, ebx
mov abby.yPos, ecx
INVOKE RotateBlit, OFFSET ABBY, ebx, ecx, abby.angle
noabby:

cmp zapdos.visible, 0
jne nozapdos
INVOKE DrawInt, 550, 0, currHP

mov ebx, zapdos.xPosFixed
mov ecx, zapdos.yPosFixed
sar ebx, 16
sar ecx, 16
mov zapdos.xPos, ebx
mov zapdos.yPos, ecx
INVOKE RotateBlit, OFFSET aa_j, ebx, ecx, zapdos.angle
nozapdos:

cmp venomoth.visible, 0
jne novenomoth
INVOKE DrawInt, 550, 0, currHP

mov ebx, venomoth.xPosFixed
mov ecx, venomoth.yPosFixed
sar ebx, 16
sar ecx, 16
mov venomoth.xPos, ebx
mov venomoth.yPos, ecx
INVOKE RotateBlit, OFFSET atv, ebx, ecx, venomoth.angle
novenomoth:

cmp omanyte.visible, 0
jne noomanyte
INVOKE DrawInt, 550, 0, currHP

mov ebx, omanyte.xPosFixed
mov ecx, omanyte.yPosFixed
sar ebx, 16
sar ecx, 16
mov omanyte.xPos, ebx
mov omanyte.yPos, ecx
INVOKE RotateBlit, OFFSET baby_helix, ebx, ecx, omanyte.angle
noomanyte:

cmp omastar.visible, 0
jne noomastar
INVOKE DrawInt, 550, 0, currHP

mov ebx, omastar.xPosFixed
mov ecx, omastar.yPosFixed
sar ebx, 16
sar ecx, 16
mov omastar.xPos, ebx
mov omastar.yPos, ecx
INVOKE RotateBlit, OFFSET lord_helix, ebx, ecx, omastar.angle
noomastar:


cmp electrode.visible, 0
jne noElectrode
mov ebx, electrode.xPosFixed
mov ecx, electrode.yPosFixed
sar ebx, 16
sar ecx, 16
mov electrode.xPos, ebx
mov electrode.yPos, ecx
INVOKE RotateBlit, ADDR ELECTRODE, ebx, ecx, electrode.angle
noElectrode:

cmp level, 6
jl enddraw

INVOKE DrawString, 0, 200, ADDR youwin

enddraw:
INVOKE EndDraw




ret

GameRender ENDP
END
