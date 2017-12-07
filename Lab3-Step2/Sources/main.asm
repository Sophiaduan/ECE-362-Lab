; ECE 362 - Lab 3 - Step 2

; Name: < enter name here >

; Lab: < enter lab division here >

; Class Number: < enter class number here >

; Use Code Warrior (CW) in Full Chip Simulation mode

;***********************************************************************
;
; Write a REENTRANT subroutine "popcnt" that counts the number of bits
; that are "1" in the 16-bit word passed to it on the stack, and returns
; that value as an 8-bit unsigned integer on the stack.  Recall that a
; reentrant subroutine does not use any global variables (i.e., any local
; variables utilized should be allocated on the stack).
;
; Note that the result can range from $00 (16-bit word was $0000) to $10
; (16-bit word was $FFFF).
;
; Stack frame at entry:
;
;      +--------------------+
; SP ->| return address - H |
;      +--------------------+
;      | return address - L |
;      +--------------------+
;      |   data word - H    |
;      +--------------------+
;      |   data word - L    |
;      +--------------------+
;
;
; Stack frame just prior to exit:
;
;      +--------------------+
; SP ->| return address - H |
;      +--------------------+
;      | return address - L |
;      +--------------------+
;      | number of "1" bits |
;      +--------------------+
;
;***********************************************************************
;
; To test and auto-grade your solution:
;	- Use CodeWarrior to assemble your code and launch the debugger
;	- Load the Auto-Grader (L3AG-2.s19) into the debugger
;		> Choose File -> Load Application
;		> Change the file type to "Motorola S-Record (*.s*)"
;		> Navigate to the 'AutoGrade' folder within your project
;		> Open 'L3AG-2.s19'
; - Open and configure the SCI terminal as a debugger component
;	- Start execution at location $800
;
; The score displayed is the number of test cases your code has passed.
; If nothing is displayed (i.e., your code "crashes"), no points will be
; awarded - note that there is no way to "protect" the application that
; tests your code from stack errors inflicted by mistakes in your code.
;
; Also note: If the message "STACK CREEP!" appears, it means that the
; stack has not been handled correctly (e.g., more pushes than pops or
; data passed to it not de-allocated correctly). 
;
;***********************************************************************

	org	$A00	; DO NOT REMOVE OR MODIFY THIS LINE

; Place your code for "popcnt" below

  pulx
  ldy #0
  ldab #0
popcnt
  pula
loop_start
  tbeq a, exit
  lsra
  adcb #00
  bra loop_start
exit
  iny
  cpy #1
  beq popcnt
  pshb
  pshx
	rts
	end