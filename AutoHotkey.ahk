; Key Modifiers:
; # is Windows Key
; ^ is Control
; ! is Alt
; + is Shift
; ~ is Passthru

; Force Admin
if not A_IsAdmin
{
   Run *RunAs "%A_ScriptFullPath%"  ; Requires v1.0.92.01+
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

; Rebind key for stupid Asus Key problem
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
!`:: ; emulate the mac swap, bind to alt-` because of muscle memory
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
    Run cmd
    return

; Spotify Control
#Left::Send   {Media_Prev}
#Down::Send   {Media_Play_Pause}
#Right::Send  {Media_Next}

; Window Control 
#o::
    WinSet, AlwaysOnTop, toggle, A
    return

; "Desktops"
!1::
    WinActivate, ahk_class CabinetWClass
    return
!2::
    WinActivate, HexChat: 
    WinActivate, HipChat
    WinActivate, + #
    WinActivate, * #
    return
!3::
    WinActivateBottom, Google Chrome
    WinActivateBottom, ahk_class MozillaWindowClass
    return
!4::
    WinActivateBottom, ahk_class KiTTY
    WinActivateBottom, ahk_class PuTTY
    WinActivateBottom, ahk_class PuTTYConfigBox
    WinActivateBottom, ahk_class Vim
    WinActivateBottom, Microsoft Visual Studio    
    return
!5::
    WinActivateBottom, ahk_class TV_CClientWindowClass
    return
!6::
    WinActivate, TeamViewer
    WinActivate, Computers & Contacts
    return
!7::
    WinActivate, Pandora Internet Radio
    WinActivateBottom, ahk_class SpotifyMainWindow
    WinActivate, Rdio
    return
!8::
    WinActivateBottom, mail - Google Chrome
    return
!9::
    WinActivateBottom, ahk_class ApolloRuntimeContentWindow
    WinActivate, Mumble -
    return
!0::
    WinActivate, µTorrent
    WinActivate, Transmission
    return
; !h:: ; email forwarder
;    MouseClick, Left, 920, 165 ; title
;    Sleep 500
;    SendInput f
;    Sleep 500
;    SendInput jay@lithosphere.com{Tab}
;    Sleep 200
;    SendInput {Tab}{Control Down}{Enter}{Control Up}
;    Sleep 200
;    MouseClick, Left, 702, 115 ; remove label
;    MouseClick, Left, 702, 115 ; remove label
;    return


#IfWinActive ahk_class RiotWindowClass
`::
    send {w down}
    sleep 3
    send {w up}
    sleep 3
    MouseClick, Left
    sleep 3
    send {q down}
    sleep 3
    send {q up}
    sleep 3
    send {q down}
    sleep 3
    send {q up}
    sleep 3
    send {q down}
    sleep 3
    send {q up}
    sleep 3
    send {q down}
    sleep 3
    send {q up}
    sleep 3
    send {q down}
    sleep 3
    send {q up}
    sleep 3
    send {q down}
    sleep 3
    send {q up}
    return



; Custom keybindings for putty
#IfWinActive ahk_class PuTTY
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




#IfWinActive PVP.net Client
!r::
    KeyWait LAlt, L 
    SendInput Hey All{!} My best roles are in order: Support | Jungle | Mid | Top | ADC. Have all champs for trades. Play all regular supports as well as unconventional supports like Amumu, Annie, Naut, Ziggs.{Enter}
    Sleep 500
    SendInput If you want to trade, have a favorite support, think MummySupport is OP?  Just let me know.  Of course, will respect pick order.  Press {#}9 to hear this message again.{Enter}
    return
