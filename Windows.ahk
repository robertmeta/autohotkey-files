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
#UseHook ; required to work with certain aggressive key-stealing apps
ScriptName = Improved Windows Bindings ; obvious really
Process, Priority,, H ; abovenormal (just slightly)
DetectHiddenWindows, Off ; Don't need hidden windows at the moment
SendMode Event ; for new scripts, superior speed and reliability
SetTitleMatchMode 2 ; can have a window match anywhere inside it
SetTitleMatchMode fast ; use fast mode
SetBatchLines, -1   ; maximize script speed!
SetWinDelay, -1 ; maximize script speed!
Menu, Tray, Icon, shell32.dll, 44 ; Make icon the star


; Groups for switching to, it is worth
; noting that they are always switched
; to in order, top to bottom
; 1
GroupAdd,One,ahk_class VirtualConsoleClass
GroupAdd,One,ahk_class CabinetWClass
GroupAdd,One,ahk_exe qbittorrent.exe
GroupAdd,One,ahk_exe WinSCP.exe
GroupAdd,One,ahk_class ConsoleWindowClass
; 2
GroupAdd,Two,HexChat:
GroupAdd,Two,freenode
GroupAdd,Two,irc.slack.com
GroupAdd,Two,gitter
GroupAdd,Two,OFTC
GroupAdd,Two,ahk_exe Discord.exe
GroupAdd,Two,ahk_exe Gitter.exe
GroupAdd,Two,ahk_exe slack.exe
GroupAdd,Two,TweetDeck
GroupAdd,Two,Hangouts
; 3
GroupAdd,Three,ahk_exe firefox.exe
GroupAdd,Three,- Google Chrome,,,Trello
GroupAdd,Three,torrents.robertmeta.com,,,WinSCP
; 4
GroupAdd,Four,ahk_exe MobaXterm_Personal_8.6.exe
GroupAdd,Four,ahk_exe PUTTY.exe,,,torrents.robertmeta.com
GroupAdd,Four,ahk_class Vim,,,Scratch.md
GroupAdd,Four,Microsoft Visual Studio
; 5
GroupAdd,Five,Trello
GroupAdd,Five,ahk_exe Evernote.exe
GroupAdd,Five,ahk_exe MySQLWorkbench.exe
; 6
GroupAdd,Six,ahk_exe PaintDotNet.exe
GroupAdd,Six,ahk_exe krita.exe
; 7
GroupAdd,Seven,ahk_class SpotifyMainWindow
GroupAdd,Seven,Google Play Music
; 8
GroupAdd,Eight,ahk_exe postbox.exe
GroupAdd,Eight, Inbox
GroupAdd,Eight, FastMail
; 9
GroupAdd,Nine,ahk_class TV_CClientWindowClass
GroupAdd,Nine,ahk_exe TeamViewer.exe
; 10
GroupAdd,Ten,ahk_class LOLPATCHER
GroupAdd,Ten,ahk_exe LolClient.exe
GroupAdd,Ten,ahk_exe Battle.net.exe
GroupAdd,Ten,ahk_exe Steam.exe
GroupAdd,Ten, Dungeon Crawl Stone Soup
GroupAdd,Ten,ahk_exe HexPatch.exe
GroupAdd,Ten,ahk_exe Hex.exe
GroupAdd,Ten,ahk_exe LeagueClientUx.exe

; Act a bit like mac
#Space::#r
!`:: ; emulate the mac swap, bind to alt-` because of muscle memory
#`:: ; emulate the mac swap, bind to win-` because that works over teamviewer/synergy
    WinGetClass, class, A
    WinActivateBottom, ahk_class %class%
    return
#t:: ; Terminal
    Run Powershell
    return
#s::
    Run gvim "~\Google Drive\personal\scratchpad.md"
    return
#e::
    IfWinExist, ahk_class CabinetWClass
    {
        WinActivate
    }
    Else
    {
	Run "explorer"
    }
    return

!a::
WinGet, currentWindow, ID, A
WinGet, ExStyle, ExStyle, ahk_id %currentWindow%
if (ExStyle & 0x8)  ; 0x8 is WS_EX_TOPMOST.
{
	Winset, AlwaysOnTop, off, ahk_id %currentWindow%
	SplashImage,, x0 y0 b fs12, OFF always on top.
	Sleep, 1500
	SplashImage, Off
}
else
{
	WinSet, AlwaysOnTop, on, ahk_id %currentWindow%
	SplashImage,,x0 y0 b fs12, ON always on top.
	Sleep, 1500
	SplashImage, Off
}
return

; I never mean to hit shift-delete and this maps it to shift-insert for stupid keyboards
+Del::+Ins
; Spotify Control
#Left::Send   {Media_Prev}
#Down::Send   {Media_Play_Pause}
#Right::Send  {Media_Next}
; Mouse4 replacement
XButton2::RControl
CapsLock::RControl

; "Desktops"
!1::
    GroupActivate, One, R
    return
!2::
    GroupActivate, Two, R
    return
!3::
    GroupActivate, Three, R
    return
!4::
    GroupActivate, Four, R
    return
!5::
    GroupActivate, Five, R
    return
!6::
    GroupActivate, Six, R
    return
!7::
    GroupActivate, Seven, R
    return
!8::
   GroupActivate, Eight, R
    return
!9::
    GroupActivate, Nine, R
    return
!0::
    GroupActivate, Ten, R
    return

; Custom keybindings for putty (with tmux)
#IfWinActive ahk_class PuTTY
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
    !WheelDown::
        SendInput {Control Down}{Space}{Control Up}n
        return
    !WheelUp::
        SendInput {Control Down}{Space}{Control Up}p
        return
}

; Support functions
ToggleActive(Win)
{
    IfWinExist, %Win%
    {
        IfWinNotActive, %Win%
        {
            WinActivate
        }
        else
        {
            WinMinimize
        }
    }
}

RunOrActivate(Target, WinTitle = "")
{
	; Get the filename without a path
	SplitPath, Target, TargetNameOnly

	Process, Exist, %TargetNameOnly%
	If ErrorLevel > 0
		PID = %ErrorLevel%
	Else
		Run, %Target%, , , PID

	; At least one app (Seapine TestTrack wouldn't always become the active
	; window after using Run), so we always force a window activate.
	; Activate by title if given, otherwise use PID.
	If WinTitle <>
	{
		SetTitleMatchMode, 2
		WinWait, %WinTitle%, , 3
		WinActivate, %WinTitle%
	}
	Else
	{
		WinWait, ahk_pid %PID%, , 3
		WinActivate, ahk_pid %PID%
	}
}
