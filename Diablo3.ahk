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
ScriptName = Diablo 3 Hand Saver; obvious really
Process, Priority,, H ; abovenormal (just slightly)
DetectHiddenWindows, Off ; Don't need hidden windows at the moment
SendMode Event ; for new scripts, superior speed and reliability
SetTitleMatchMode 2 ; can have a window match anywhere inside it
SetTitleMatchMode fast ; use fast mode
SetBatchLines, -1   ; maximize script speed!
SetWinDelay, -1 ; maximize script speed!

#IfWinActive ahk_class D3 Main Window Class
{
    ClickLoopEngaged = 0
    TimeSlept = 0

    PendingRightClick = 0
    ToggleRightClick = 0
    ~RButton::
    {
        PendingRightClick += 10000
        ToggleRightClick = 0
        return
    }
    ~RButton Up::
    {
        PendingRightClick -= 9999
        ToggleRightClick = 0
        return
    }
    !RButton::
    {
        ToggleRightClick := !ToggleRightClick
        return
    }

    PendingQ = 0
    ToggleQ = 0
    !a::
    !q::
    {
        ToggleQ := !ToggleQ
        return
    }
    ~a::
    ~q::
    {
        PendingQ += 1
        ToggleQ = 0
        return
    }

    PendingW = 0
    ToggleW = 0
    !s::
    !w::
    {
        ToggleW := !ToggleW
        return
    }
    ~s::
    ~w::
    {
        PendingW += 1
        ToggleW = 0
        return
    }

    PendingE = 0
    ToggleE = 0
    ~d::
    ~e::
    {
        PendingE += 1
        ToggleE = 0
        return
    }
    !d::
    !e::
    {
        ToggleE := !ToggleE
        return
    }

    PendingR = 0
    ToggleR = 0
    ~r::
    ~f::
    {
        PendingR += 1
        ToggleR = 0
        return
    }
    !r::
    !f::
    {
        ToggleR := !ToggleR
        return
    }

    ToggleCombo = 0
    ~t::
    ~g::
    {
        ToggleCombo := !ToggleCombo
        return
    }

    +MButton::
    MButton::
    {
	ClickLoopEngaged := !ClickLoopEngaged
	While ClickLoopEngaged
        {
            If (PendingRightClick > 0 or ToggleRightClick > 0 or ToggleCombo > 0)
            {
                Sleep 10
                TimeSlept += 10
                SendInput, {RButton Down}
                Sleep 50
                TimeSlept += 50
                SendInput, {RButton Up}
                PendingRightClick -= 1
                Sleep 10
                TimeSlept += 10
            }
            If (PendingR > 0 or ToggleR > 0)
            {
                Sleep 10
                TimeSlept += 10
                SendInput, {r Down}
                Sleep 50
                TimeSlept += 50
                SendInput, {r Up}
                PendingR -= 1
                Sleep 10
                TimeSlept += 10
            }
            If (PendingE > 0 or ToggleE > 0 or ToggleCombo > 0)
            {
                Sleep 10
                TimeSlept += 10
                SendInput, {e Down}
                Sleep 50
                TimeSlept += 50
                SendInput, {e Up}
                PendingE -= 1
                Sleep 10
                TimeSlept += 10
            }
            If (PendingQ > 0 or ToggleQ > 0 or ToggleCombo > 0)
            {
                Sleep 10
                TimeSlept += 10
                SendInput, {q Down}
                Sleep 50
                TimeSlept += 50
                SendInput, {q Up}
                PendingQ -= 1
                Sleep 10
                TimeSlept += 10
            }
            If (PendingW > 0 or ToggleW > 0)
            {
                Sleep 10
                TimeSlept += 10
                SendInput, {w Down}
                Sleep 50
                TimeSlept += 50
                SendInput, {w Up}
                PendingW -= 1
                Sleep 10
                TimeSlept += 10
            }

            SendInput, {LButton Down}
            Sleep 100
            TimeSlept += 100
            SendInput, {LButton Up}
        }
	return
    }

    ~LButton::
    {
        ClickLoopEngaged = 0
        TimeSlept = 0
        PendingQ = 0
        PendingW = 0
        PendingE = 0
        PendingR = 0
        PendingRightClick = 0
        ToggleQ = 0
        ToggleW = 0
        ToggleE = 0
        ToggleR = 0
        ToggleRightClick = 0
        return
    }
}
