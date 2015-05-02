; Key Modifiers:
; # is Windows Key
; ^ is Control
; ! is Alt
; + is Shift
; ~ is Passthru

; Force Admin
if not A_IsAdmin
{
    DllCall("shell32\ShellExecuteA", uint, 0, str, "RunAs", str, A_AhkPath, str, """" . A_ScriptFullPath . """", str, A_WorkingDir, int, 1)
    ExitApp
}

; Basic Settings
#SingleInstance, Force ; Only want one copy of my hotkeys
#NoEnv  ; for performance and compatibility with future AutoHotkey releases.
ScriptName = Robert Meltons Basics ; obvious really
Process, Priority,, H ; abovenormal (just slightly)
DetectHiddenWindows, Off ; Don't need hidden windows at the moment
SendMode Event ; for new scripts, superior speed and reliability
SetTitleMatchMode 2 ; can have a window match anywhere inside it
SetTitleMatchMode fast ; use fast mode
SetBatchLines, -1   ; maximize script speed! 
SetWinDelay, -1 ; maximize script speed!
#InstallKeybdHook
#UseHook On

; Rebind key for stupid new logitech keyboard
;Capslock::Ctrl

; Act a bit like mac
F3::#`
#Space::#r
!`:: ; emulate the mac swap, bind to alt-` because of muscle memory
    WinGetClass, class, A
    WinActivateBottom, ahk_class %class%
    return

; Run Applications
#t::
    Run Cmder
    return

; Audio/Video/Volume Control
#Left::Send   {Media_Prev}
#Down::Send   {Media_Play_Pause}
#Right::Send  {Media_Next}
!Up::Run nircmd changesysvolume +100 
!Down::Run nircmd changesysvolume -100 

; Left side of main desktop
!l::
    WinMove, A,, 0, 0, 1280, 1560
    return
