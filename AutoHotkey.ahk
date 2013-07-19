; Key Modifiers:
; # is Windows Key
; ^ is Control
; ! is Alt
; + is Shift

; Basic Settings
#SingleInstance, Force ; Only want one copy of my hotkeys
#NoEnv  ; for performance and compatibility with future AutoHotkey releases.
ScriptName = Robert Meltons Basics ; obvious really
Process, Priority,, H ; abovenormal (just slightly)
DetectHiddenWindows, Off ; Don't need hidden windows at the moment
SendMode Input  ; for new scripts, superior speed and reliability
SetTitleMatchMode 2 ; can have a window match anywhere inside it
SetTitleMatchMode fast ; use fast mode

; Rebind key for stupid Asus Key problem
+Del::+Ins
SetNumlockState, on ; turn on numlock
Numlock::ScrollLock ; then bind it to scrolllock for working with synergy

; Act a bit like mac
#Space::#r 
#`:: ; emulate the mac swap, bind to win-` because that works over teamviewer/synergy
    WinGetClass, class, A
    WinActivateBottom, ahk_class %class%
    return
#k::
    Run kitty
    return
!1::
    WinActivate, ahk_class CabinetWClass
    return
!2::
    WinActivate, freenode
    WinActivate, imo
    WinActivate, HexChat: 
    WinActivateBottom, ahk_class TConversationForm
    return
!3::
    WinActivateBottom, Google Chrome
    WinActivateBottom, Firefox
    return
!4::
    WinActivateBottom, ahk_class KiTTY
    WinActivateBottom, ahk_class PuTTY
    WinActivateBottom, ahk_class PuTTYConfigBox
    return
!5::
    WinActivateBottom, Microsoft Visual Studio
    return
!6::
    WinActivate, TeamViewer
    WinActivate, Computers & Contacts
    WinActivateBottom, ahk_class TV_CClientWindowClass
    return
!7::
    WinActivate, Pandora Internet Radio
   WinActivateBottom, ahk_class SpotifyMainWindow
    WinActivate, Rdio
    return
!8::
    WinActivate, Inky�
    WinActivateBottom, @gmail.com - Gmail
    return
!9::
    WinActivateBottom, ahk_class ApolloRuntimeContentWindow
    WinActivate, Mumble -
    return
!0::
    WinActivate, �Torrent
    return

; Run Applications
#n::
    Run evernote
    return
#t::
    Run cmd
    return

; Spotify Control
#Right:: 
    ControlSend, ahk_parent, ^{Right}, ahk_class SpotifyMainWindow 
    Sleep, 500
    WinGetTitle, now_playing, ahk_class SpotifyMainWindow 
    StringTrimLeft, playing, now_playing, 10 
    TrayTip, Now playing:, %playing%., 10 , 16
    return 
#Left:: 
    ControlSend, ahk_parent, ^{Left}, ahk_class SpotifyMainWindow 
    Sleep, 500
    WinGetTitle, now_playing, ahk_class SpotifyMainWindow 
    StringTrimLeft, playing, now_playing, 10 
    TrayTip, Now playing:, %playing%., 10 , 16
    return 
#Down:: 
    ControlSend, ahk_parent, {Space}, ahk_class SpotifyMainWindow 
    return 

; Window Control 
#o::
    WinSet, AlwaysOnTop, toggle, A
    return

