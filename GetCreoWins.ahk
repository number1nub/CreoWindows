GetCreoWins(wList, curWin = "")
{
	creoWins := {}
	curWin := curWin ? curWin : WinExist("A")
	WinGetTitle, curTitle, ahk_id %curWin%
	
	Loop, Parse, wList, CSV
	{
		WinGetTitle, title, ahk_id %A_LoopField%
		if (InStr(title, "Creo Parametric"))
		{
			if (InStr(title, "(Active)"))
				creoWins.active := { id: A_LoopField, title: title, index: A_Index }
			if (title = curTitle)
				creoWins.current := {id: A_LoopField, title: title, index: A_Index}
			creoWins.List.Insert({id: A_LoopField, title: title})
		}
	}
}