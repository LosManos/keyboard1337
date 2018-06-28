#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.

SetCapsLockState AlwaysOff

; Toggle Capslock with alt-CapsLock.
!CapsLock::CapsLock

; Esc.
CapsLock::Send {Esc}

; Arrows.
;CapsLock & j::Send {Left}
CapsLock & j::
	if GetKeyState("Shift")
		SendInput +{Left}
	else
		SendInput {Left}
	Return

;CapsLock & k::Send {Right}
CapsLock & k::
	If GetKeyState("Shift")
		SendInput +{Right}
	Else
		SendInput {Right}
	Return

;CapsLock & SC027::Send {Down} ; or CapsLock & `;::Send {Down}
CapsLock & SC027::
	If GetKeyState("Shift")
		SendInput +{Down}
	Else
		SendInput {Down}
	Return

;CapsLock & l::Send {Up}
CapsLock & l::
	If GetKeyState("Shift")
		SendInput +{Up}
	Else
		SendInput {Up}
	Return

;CapsLock & u::Send ^{Left}
CapsLock & u::
	If GetKeyState("Shift")
		SendInput +^{Left}
	Else
		SendInput ^{Left}
	Return


;CapsLock & i::Send ^{Right}
CapsLock & i::
	If GetKeyState("Shift")
		SendInput +^{Right}
	Else
		SendInput ^{Right}
	Return


; Backspace and Del.
CapsLock & h::Send {Backspace}

; Home and End.
;CapsLock & m::Send {Home}
CapsLock & m::
	If GetKeyState("Shift")
		SendInput +{Home}
	Else
		SendInput {Home}
	Return
;CapsLock & ,::Send {End}
CapsLock & ,::
	If GetKeyState("Shift")
		SendInput +{End}
	Else
		SendInput {End}
	Return

; Mark word left.
CapsLock & y::Send ^+{Left}

;
; Experimental.
;

CapsLock & w::Send ^{F4}

;Space::Send {Space}
;Space & j::Send {Left}
;Space & k::Send {Right}
;Space & SC027::Send {Down} ; or Space & `;::Send {Down}
;Space & l::Send {Up}
;Space & u::Send ^{Left}
;Space & i::Send ^{Right}
; https://stackoverflow.com/questions/2096253/autohotkey-key-sequence-not-just-single-key-hotkey
; ^q::

; command-T/D => date
; command-T/T => time
; Can we make a menu out of this?
CapsLock & T::
	Input Key, L1
	If (Key="D"){
		If (GetKeyState("Shift")){
			FormatTime, TimeString,, yyyyMMddHHmm
		}Else{
			FormatTime, TimeString,, yyyyMMdd
		}
	}
	If (Key="T"){
		FormatTime, TimeString,, HHmm
	}
	Send %TimeString%
