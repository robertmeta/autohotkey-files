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
DetectHiddenWindows, On ; Otherwise WinExists fails on hidden windows
SendMode Input  ; for new scripts, superior speed and reliability
SetTitleMatchMode 2 ; can have a window match anywhere inside it
SetTitleMatchMode fast ; use fast mode

; Rebind key for stupid Asus Key problem
+Del::+Ins

!1::
    WinActivateBottom, ahk_class CabinetWClass
    WinActivateBottom, Oracle VM VirtualBox
    WinActivate, Oracle VM VirtualBox Manager
    return
!2::
    WinActivate, imo
    WinActivate, freenode
    WinActivate, Skype™
    return
!3::
    WinActivate, Google Chrome
    return
!4::
    WinActivateBottom, ahk_class KiTTY
    return
!5::
    WinActivate, TeamViewer
    WinActivate, Computers & Contacts
    return
!6::
    return
!7::
    WinActivateBottom, ahk_class SpotifyMainWindow
    WinActivate, Pandora Internet Radio
    return
!8::
    WinActivate, robert.melton@gmail.com - Gmail
    WinActivate, inky™
    return
!9::
    WinActivateBottom, ahk_class ApolloRuntimeContentWindow
    WinActivate, Mumble -
    return
!0::
    return

; Run Applications
#n::
    Run https://docs.google.com/document/d/1FI10r_ly5ERLhRYkMqazakVeF_AOtWoQgiHqEJjgbi4/edit
    return
#v::
    Run C:\Users\rmelton\bin\VMLink
    return
#w::
    Run C:\Users\rmelton\bin\WorkLink
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

