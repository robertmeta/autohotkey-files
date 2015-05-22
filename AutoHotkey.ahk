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
#InstallMouseHook
#UseHook On

; Groups for switching to, it is worth 
; noting that they are always switched 
; to in order, top to bottom
GroupAdd,One,ahk_class VirtualConsoleClass
GroupAdd,One,ahk_class CabinetWClass
GroupAdd,Two,- Slack
GroupAdd,Two,Mumble -
GroupAdd,Two,#
GroupAdd,Two,TweetDeck
GroupAdd,Two,Skype
GroupAdd,Two,Hangouts
GroupAdd,Three,- Google Chrome
GroupAdd,Four,ahk_exe PUTTY.exe
GroupAdd,Four,ahk_class Vim,,,Scratch.md
GroupAdd,Four,Microsoft Visual Studio    
GroupAdd,Five,ahk_exe Evernote.exe
GroupAdd,Six,ahk_exe PaintDotNet.exe
GroupAdd,Six,ahk_exe krita.exe
GroupAdd,Seven,ahk_class ApolloRuntimeContentWindow
GroupAdd,Eight,ahk_exe postbox.exe
GroupAdd,Nine,ahk_exe TeamViewer.exe
GroupAdd,Ten,ahk_exe qbittorrent.exe

; Act a bit like mac
#Space::#r
!`:: ; emulate the mac swap, bind to alt-` because of muscle memory
#`:: ; emulate the mac swap, bind to win-` because that works over teamviewer/synergy
    WinGetClass, class, A
    WinActivateBottom, ahk_class %class%
    return
#t:: ; Terminal
    Run Cmder
    return
#s:: ; Terminal
    IfWinExist, Scratch.md
    {
        WinActivate
    }
    else
    {
        Run C:\Users\Robert\OneDrive\Scratch.md
    }
    return
#!o:: ; always on top
    WinSet, AlwaysOnTop, toggle, A
    return
#!l:: ; left side of main desktop
    WinMove, A,, 0, 0, 1280, 1560
    return

; I never mean to hit shift-delete and this maps it to shift-insert for stupid keyboards
+Del::+Ins
; Spotify Control
#Left::Send   {Media_Prev}
#Down::Send   {Media_Play_Pause}
#Right::Send  {Media_Next}
; {Volume_Up}
!Up::Run nircmd changesysvolume +100 
; {Volume_Down}
!Down::Run nircmd changesysvolume -100 

; "Desktops"
!1::
    GroupActivate, One
    return
!2::
    GroupActivate, Two
    return
!3::
    GroupActivate, Three
    return
!4::
    GroupActivate, Four
    return
!5::
    GroupActivate, Five
    return
!6::
    GroupActivate, Six
    return
!7::
    GroupActivate, Seven
    return
!8::
    GroupActivate, Eight
    return
!9::
    GroupActivate, Nine
    return
!0::
    GroupActivate, Ten
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
