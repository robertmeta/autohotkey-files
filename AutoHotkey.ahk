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
!`:: ; emulate the mac swap, bind to alt-` because of muscle memory
#`:: ; emulate the mac swap, bind to win-` because that works over teamviewer/synergy
WinGetClass, class, A
WinActivateBottom, ahk_class %class%
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
; {Volume_Up}
!Up::Run nircmd changesysvolume +100 
; {Volume_Down}
!Down::Run nircmd changesysvolume -100 

; Window Control 
#o::
WinSet, AlwaysOnTop, toggle, A
return

; "Desktops"
!1::
    WinActivate, ahk_class VirtualConsoleClass
    WinActivate, ahk_class CabinetWClass
    WinActivate, ahk_class ShockwaveFlashFullScreen
    WinActivate, - VLC media player
    return
!2::
    WinActivate, TweetDeck
    WinActivate, Mumble -
    WinActivate, HexChat 
    WinActivate, Skype
    WinActivate, Hangouts
    WinActivate, Dekkers Slack
    WinActivate, ahk_class ShockwaveFlashFullScreen
    WinActivate, - VLC media player
    return
!3::
    WinActivateBottom, Google Chrome
    WinActivateBottom, ahk_class MozillaWindowClass
    WinActivateBottom, - Vimperator
    WinActivate, ahk_class ShockwaveFlashFullScreen
    WinActivate, - VLC media player
    return
!4::
    WinActivateBottom, ahk_class PuTTY
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
#s::
    ToggleActive("Dekkers Slack")
    return
#d::
    ToggleActive("Firefox Developer Edition")
    return
#c::
    ToggleActive("ahk_class PuTTY")
    return
!l::
    WinMove, A,, 0, 0, 1280, 1560
    return

ToggleActive(win)
{
    IfWinExist, %win%
    { 
        IfWinNotActive, %win%
        {
            WinActivate
        }
        else 
        {
            WinMinimize
        } 
    }
}
