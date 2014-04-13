; #########################################################################
;
;   game.inc - Includes for EECS205 Assignment 4/5
;
;
; #########################################################################

;; These are library routines that you will call (but do NOT have to implement)
BeginDraw PROTO
EndDraw PROTO

;; You should not need to modify these prototypes (actually, it would probably be bad)
GameInit PROTO
GameMain PROTO mouseStatus:DWORD, keyDown:DWORD, keyUp:DWORD

;; Useful Library Routines
DrawString PROTO x:DWORD, y:DWORD, string:PTR BYTE 
DrawInt PROTO x:DWORD, y:DWORD, value:DWORD

;; Feel free to modify the following
GameRender PROTO
GameLogic PROTO xinc:DWORD, yinc:DWORD
RandomNum PROTO
CollisionCheck PROTO obj1:PTR Sprite, obj2:PTR Sprite, tol:DWORD
levelShift PROTO

EXTERNDEF lpTyroneBmp:DWORD

Sprite STRUCT
	xPos DWORD ?
	yPos DWORD ?
	xPosFixed DWORD ?
	yPosFixed	DWORD ?
	xVel DWORD ?
	yVel DWORD ?
	angle DWORD ?
	visible DWORD ?
        hp DWORD ?
Sprite ENDS
EXTERNDEF hpcost: DWORD
EXTERNDEF dmgcost: DWORD
EXTERNDEF spdcost: DWORD
EXTERNDEF upgradecount:DWORD
EXTERNDEF points:DWORD
EXTERNDEF level:Dword
EXTERNDEF mouseX:DWORD
EXTERNDEF mouseY:DWORD
EXTERNDEF BIRD: EECS205BITMAP
EXTERNDEF bird: Sprite
EXTERNDEF PIPE: EECS205BITMAP
EXTERNDEF pipe: Sprite
EXTERNDEF DOWNPIPE: EECS205BITMAP
EXTERNDEF downPipe: Sprite
EXTERNDEF poke: Sprite
EXTERNDEF POKE: EECS205BITMAP
EXTERNDEF abby: Sprite
EXTERNDEF ABBY: EECS205BITMAP
EXTERNDEF aa_j: EECS205BITMAP
EXTERNDEF zapdos: Sprite
EXTERNDEF atv: EECS205BITMAP
EXTERNDEF venomoth: Sprite
EXTERNDEF baby_helix: EECS205BITMAP
EXTERNDEF omanyte: Sprite
EXTERNDEF lord_helix: EECS205BITMAP
EXTERNDEF omastar: Sprite
EXTERNDEF ELECTRODE: EECS205BITMAP
EXTERNDEF electrode: Sprite
EXTERNDEF currHP: DWORD
EXTERNDEF pause: DWORD
EXTERNDEF gravity: DWORD