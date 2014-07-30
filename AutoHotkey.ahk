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
#InstallKeybdHook
#UseHook On

; Rebind key for stupid Asus default keys problem
+Del::+Ins

;SetNumlockState, on ; turn on numlock
;Numlock::ScrollLock ; then bind it to scrolllock for working with synergy
; Rebind key for stupid new logitech keyboard
LWin & Tab::AltTab
;Capslock::Ctrl

; Act a bit like mac
#Space::#r 
#`:: ; emulate the mac swap, bind to win-` because that works over teamviewer/synergy
    WinGetClass, class, A
    WinActivateBottom, ahk_class %class%
    return
#s::
    SendInput {Control Down}{Alt Down}n{Alt Up}{Control Up}
    return

; Run Applications
#n::
    Run https://drive.google.com/keep/u/0/#home
    return
#t::
    Run %comspec%
    return

; Spotify Control
#Left::Send   {Media_Prev}
#Down::Send   {Media_Play_Pause}
#Right::Send  {Media_Next}
!Up::Send     {Volume_Up}
!Down::Send   {Volume_Down}

; Window Control 
#o::
    WinSet, AlwaysOnTop, toggle, A
    return

; "Desktops"
!1::
    WinActivate, ahk_class CabinetWClass
    WinActivate, ahk_class ShockwaveFlashFullScreen
    WinActivate, - VLC media player
    return
!2::
    WinActivate, TweetDeck
    WinActivate, Mumble -
    WinActivate, HexChat 
    WinActivate, HipChat
    WinActivate, Skype
    WinActivate, Hangouts
    WinActivate, ahk_class ShockwaveFlashFullScreen
    WinActivate, - VLC media player
    return
!3::
    WinActivateBottom, Google Chrome
    WinActivateBottom, ahk_class MozillaWindowClass
    #IfWinActive ahk_class MozillaWindowClass
    {
        Send {Control Down}``{Control Up}
    }
    WinActivate, ahk_class ShockwaveFlashFullScreen
    WinActivate, - VLC media player
    return
!4::
    WinActivateBottom, ahk_class KiTTY
    WinActivateBottom, ahk_class PuTTY
    WinActivateBottom, ahk_class PuTTYConfigBox
    WinActivateBottom, ahk_class Vim
    WinActivateBottom, Microsoft Visual Studio    
    WinActivate, ahk_class ShockwaveFlashFullScreen
    WinActivate, - VLC media player
    return
!5::
    WinActivate, ahk_class ShockwaveFlashFullScreen
    WinActivate, - VLC media player
    return
!6::
    WinActivateBottom, ahk_class TV_CClientWindowClass
    WinActivate, TeamViewer
    WinActivate, Computers & Contacts
    WinActivate, ahk_class ShockwaveFlashFullScreen
    WinActivate, - VLC media player
    return
!7::
    WinActivate, Pandora Internet Radio
    WinActivateBottom, ahk_class SpotifyMainWindow
    WinActivate, Rdio
    WinActivate, ahk_class ShockwaveFlashFullScreen
    WinActivate, - VLC media player
    return
!8::
    WinActivateBottom, mail - Google Chrome
    WinActivate, ahk_class ShockwaveFlashFullScreen
    WinActivate, - VLC media player
    return
!9::
    WinActivateBottom, ahk_class ApolloRuntimeContentWindow
    WinActivate, ahk_class ShockwaveFlashFullScreen
    WinActivate, - VLC media player
    return
!0::
    WinActivate, µTorrent
    WinActivate, Transmission
    WinActivate, ahk_class ShockwaveFlashFullScreen
    WinActivate, - VLC media player
    return

; Alistar Charge/Knockup
#IfWinActive ahk_class RiotWindowClass
{
`::
    send {w down}
    sleep 1
    send {w up}
    sleep 1
    MouseClick, Left
    sleep 1
    send {q down}
    sleep 1
    send {q up}
    sleep 1
    send {q down}
    sleep 1
    send {q up}
    sleep 1
    send {q down}
    sleep 1
    send {q up}
    sleep 1
    send {q down}
    sleep 1
    send {q up}
    sleep 1
    send {q down}
    sleep 1
    send {q up}
    sleep 1
    send {q down}
    sleep 1
    send {q up}
    sleep 1
    send {q down}
    sleep 1
    send {q up}
    sleep 1
    send {q down}
    sleep 1
    send {q up}
    sleep 1
    send {q down}
    sleep 1
    send {q up}
    sleep 1
    send {q down}
    sleep 1
    send {q up}
    sleep 1
    send {q down}
    sleep 1
    send {q up}
    return
}

; Custom keybindings for putty
#IfWinActive ahk_class KiTTY
{
^1::
    SendInput {Control Down}{Space}{Control Up}:select-window -t 1{Enter}
    return
^2::
    SendInput {Control Down}{Space}{Control Up}:select-window -t 2{Enter}
    return
^3::
    SendInput {Control Down}{Space}{Control Up}:select-window -t 3{Enter}
    return
^4::
    SendInput {Control Down}{Space}{Control Up}:select-window -t 4{Enter}
    return
^5::
    SendInput {Control Down}{Space}{Control Up}:select-window -t 5{Enter}
    return
^6::
    SendInput {Control Down}{Space}{Control Up}:select-window -t 6{Enter}
    return
^7::
    SendInput {Control Down}{Space}{Control Up}:select-window -t 7{Enter}
    return
^8::
    SendInput {Control Down}{Space}{Control Up}:select-window -t 8{Enter}
    return
^9::
    SendInput {Control Down}{Space}{Control Up}:select-window -t 9{Enter}
    return
^0::
    SendInput {Control Down}{Space}{Control Up}:select-window -t 10{Enter}
    return
WheelUp::
    SendInput {PgUp}
    return
WheelDown::
    SendInput {PgDn}
    return
}

#IfWinNotActive ahk_class MozillaWindowClass
{
!`:: ; emulate the mac swap, bind to alt-` because of muscle memory
    WinGetClass, class, A
    WinActivateBottom, ahk_class %class%
    return
}
#IfWinActive ahk_class MozillaWindowClass
{
!`:: ; emulate the mac swap, bind to alt-` because of muscle memory
    Send {Control Down}``{Control Up}
    return
}