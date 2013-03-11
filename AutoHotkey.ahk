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

; Act a bit like mac
#Space::#r ; using other app for this

!`::
    WinGetClass, class, A
    WinActivateBottom, ahk_class %class%
    return

;!1::
;    WinActivate, ahk_class CabinetWClass
;    return
;!2::
;    WinActivate, freenode
;    WinActivate, imo
;    return
;!3::
;    WinActivateBottom, Google Chrome
;    return
;!4::
;    WinActivateBottom, ahk_class KiTTY
;    WinActivateBottom, ahk_class PuTTY
;    WinActivateBottom, ahk_class PuTTYConfigBox
;    return
;!5::
;    WinActivate, TeamViewer
;    WinActivate, Computers & Contacts
;    WinActivateBottom, ahk_class TV_CClientWindowClass
;    return
;!6::
;    WinActivateBottom, Microsoft Visual Studio
;    return
;!7::
;    WinActivate, Pandora Internet Radio
;    WinActivateBottom, ahk_class SpotifyMainWindow
;    WinActivate, Rdio
;    return
;!8::
;    WinActivate, Inky™
;    WinActivateBottom, @gmail.com - Gmail
;    return
;!9::
;    WinActivateBottom, ahk_class ApolloRuntimeContentWindow
;    WinActivate, Mumble -
;    return
;!0::
;    WinActivate, µTorrent
;    return

; Run Applications
#n::
    Run evernote
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

; Rdio Control
#Right:: 
    ControlSend, , +{Right}, Rdio 
    return  
#Left:: 
    ControlSend, , +{Left}, Rdio 
    return  
#Down:: 
    ControlSend, , +{Space}, Rdio 
    return  

; Window Control 
#o::
    WinSet, AlwaysOnTop, toggle, A
    return

