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
    KeepArcaneOrbStacks = 0
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
    !q::
    {
        ToggleQ := !ToggleQ
        return
    }
    ~q::
    {
        PendingQ += 1
        ToggleQ = 0
        return
    }
    !a::
    {
        ToggleQ := !ToggleQ
        return
    }
    ~a::
    {
        PendingQ += 1
        ToggleQ = 0
        return
    }

    PendingW = 0
    ToggleW = 0
    !w::
    {
        ToggleW := !ToggleW
        return
    }
    ~w::
    {
        PendingW += 1
        ToggleW = 0
        return
    }
    !s::
    {
        ToggleW := !ToggleW
        return
    }
    ~s::
    {
        PendingW += 1
        ToggleW = 0
        return
    }


    PendingE = 0
    ToggleE = 0
    ~e::
    {
        PendingE += 1
        ToggleE = 0
        return
    }
    !e::
    {
        ToggleE := !ToggleE
        return
    }
    ~d::
    {
        PendingE += 1
        ToggleE = 0
        return
    }
    !d::
    {
        ToggleE := !ToggleE
        return
    }


    PendingR = 0
    ToggleR = 0
    !r::
    {
        ToggleR := !ToggleR
        return
    }
    ~r::
    {
        PendingR += 1
        ToggleR = 0
        return
    }
    !f::
    {
        ToggleR := !ToggleR
        return
    }
    ~f::
    {
        PendingR += 1
        ToggleR = 0
        return
    }

    ; Archon Mode
    ~t::
    {
	; Trying to get procs to cooldown Archon
        ToggleQ = 0
        ToggleR = 0
        return
    }
    ~t Up::
    {
	; GO GO GO
        ToggleQ = 1
        ToggleR = 1
        return
    }
    ~g::
    {
	; Trying to get procs to cooldown Archon
        ToggleQ = 0
        ToggleR = 0
        return
    }
    ~g Up::
    {
	; GO GO GO
        ToggleQ = 1
        ToggleR = 1
        return
    }


    MButton::
    {
	ClickLoopEngaged := !ClickLoopEngaged
	While ClickLoopEngaged
        {
            ; E first because it is teleport
            If (PendingE > 0 or ToggleE > 0)
            {
                SendInput, {e Down}
                Sleep 20
                TimeSlept += 20
                SendInput, {e Up}
                PendingE -= 1
            }
            If (PendingR > 0 or ToggleR > 0)
            {
                SendInput, {r Down}
                Sleep 20
                TimeSlept += 20
                SendInput, {r Up}
                PendingR -= 1
            }
            If (PendingQ > 0 or ToggleQ > 0)
            {
                SendInput, {q Down}
                Sleep 20
                TimeSlept += 20
                SendInput, {q Up}
                PendingQ -= 1
            }
            If (PendingW > 0 or ToggleW > 0)
            {
                SendInput, {w Down}
                Sleep 20
                TimeSlept += 20
                SendInput, {w Up}
                PendingW -= 1
            }
            If (PendingRightClick > 0 or ToggleRightClick > 0)
            {
                SendInput, {RButton Down}
                Sleep 20
                TimeSlept += 20
                SendInput, {RButton Up}
                PendingRightClick -= 1
            }
            ; This will keep up the Arcane Orb stacks
            If (KeepArcaneOrbStacks > 0 and TimeSlept > 4500)
            {
                SendInput, {Shift Down}
                SendInput, {LButton Down}
                Sleep 20
                SendInput, {LButton Up}
                SendInput, {Shift Up}
                TimeSlept = 0
            }

            SendInput, {LButton Down}
            Sleep 200
            TimeSlept += 200
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
