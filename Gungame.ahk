; Key Modifiers:
; # is Windows Key
; ^ is Control
; ! is Alt
; + is Shift
; ~ is Passthru

; Basic Settings
#SingleInstance, Force ; Only want one copy of my hotkeys
#NoEnv  ; for performance and compatibility with future AutoHotkey releases.
#MaxThreadsPerHotkey 4 ; this allow us to have loops and so forth
#WinActivateForce ; avoid weird flashing taskbar buttons on switch
ScriptName = Gungame Hand Saver; obvious really
Process, Priority,, H ; abovenormal (just slightly)
DetectHiddenWindows, Off ; Don't need hidden windows at the moment
SendMode Event ; for new scripts, superior speed and reliability
SetTitleMatchMode 2 ; can have a window match anywhere inside it
SetTitleMatchMode fast ; use fast mode
SetBatchLines, -1   ; maximize script speed!
SetWinDelay, -1 ; maximize script speed!
Menu, Tray, Icon, shell32.dll, 266 ; Clock Look (Gungame is time sink)

#IfWinActive ahk_exe EtG.exe
{
    ClickLoopEngaged = 0
    TimeSlept = 0

    +MButton::
    MButton::
    {
	ClickLoopEngaged := !ClickLoopEngaged
	While ClickLoopEngaged
        {
            SendInput, {LButton Down}
            Sleep 20
            TimeSlept += 20
            SendInput, {LButton Up}
        }
	return
    }

    ~LButton::
    {
        ClickLoopEngaged = 0
        TimeSlept = 0
        return
    }
}
