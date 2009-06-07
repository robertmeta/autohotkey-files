; Key Modifiers:
; # is Windows Key
; ^ is Control
; ! is Alt
;
; API Notes
; WinMove, WinTitle, WinText, X, Y [, Width, Height, ExcludeTitle, ExcludeText]
;

; Basic Settings
#SingleInstance, Force ; Only want one copy of my hotkeys
#NoEnv  ; for performance and compatibility with future AutoHotkey releases.
ScriptName = Robert Meltons Basics ; obvious really
Process, Priority,, A ; abovenormal (just slightly)
DetectHiddenWindows, On ; Otherwise WinExists fails on hidden windows
SendMode Input  ; for new scripts, superior speed and reliability

; Run Applications
#n::
    Run C:\Users\rmelton\Documents\Scratchpad.notes ; open scratchpad (vim by filetype)
    return
#f::
    Run C:\Program Files\Everything\everything.exe ; open e
    return
#p::
    Run C:\Users\rmelton\Projects
    return
#d::
    Run C:\Users\rmelton\Downloads
    return

; Window Control 
#o::
    WinSet, AlwaysOnTop, toggle, A
    return
#Up::
    SnapToTop()
    return
#Down::
    SnapToBottom()
    return
#Left::
    SnapToLeft()
    return
#Right::
    SnapToRight()
    return

; iTunes/Pandora Control
#s::
    if WinExist("ahk_class iTunes") {
        ControlSend, ahk_parent, ^{SPACE}
	Sleep 150
        return 
    }

    Send,{Media_Play_Pause}
    Sleep 150
    return

#x::
    if WinExist("ahk_class iTunes") {
        ControlSend, ahk_parent, ^{RIGHT}
        Sleep 150
        return
    }

    Send,{Media_Next} ; Next
    Sleep 150
    return

#z::
    if WinExist("ahk_class iTunes") {
        ControlSend, ahk_parent, ^{LEFT}; 
        Sleep 150
        return
    }

    Send,{Media_Prev} ; Next
    Sleep 150
    return

SnapToTop() {
    WinGet, HWND, ID, A
    WinRestore, ahk_id %HWND%
    WinGetPos, X, Y, W, H, ahk_id %HWND%
    if (Y != 0) {
        SysGet, MP, MonitorPrimary
        SysGet, MWA, MonitorWorkArea, %MP%
        NewHeight := H + Y
        WinMove, ahk_id %HWND%,,%X%,0,%W%,%NewHeight%
    }
    return
}

SnapToBottom() {
    WinGet, HWND, ID, A
    WinRestore, ahk_id %HWND%
    WinGetPos, X, Y, W, H, ahk_id %HWND%
    SysGet, MP, MonitorPrimary
    SysGet, MWA, MonitorWorkArea, %MP%
    if (Y+H != MWABottom) {
        NewHeight := MWABottom - Y
        NewY := MWABottom - NewHeight
        WinMove, ahk_id %HWND%,,%X%,%NewY%,%W%,%NewHeight%
    }
    return
}

SnapToLeft() {
    WinGet, HWND, ID, A
    WinRestore, ahk_id %HWND%
    WinGetPos, X, Y, W, H, ahk_id %HWND%
    if (X != 0) {
        SysGet, MP, MonitorPrimary
        SysGet, MWA, MonitorWorkArea, %MP%
        NewWidth := W + X
        WinMove, ahk_id %HWND%,,0,%Y%,%NewWidth%,%H%
    }
    return
}

SnapToRight() {
    WinGet, HWND, ID, A
    WinRestore, ahk_id %HWND%
    WinGetPos, X, Y, W, H, ahk_id %HWND%
    SysGet, MP, MonitorPrimary
    SysGet, MWA, MonitorWorkArea, %MP%
    if (X+W != MWARight) {
        NewWidth := MWARight - X
        NewX := MWARight - NewWidth
        WinMove, ahk_id %HWND%,,%NewX%,%Y%,%NewWidth%,%H%
    }
    return
}
