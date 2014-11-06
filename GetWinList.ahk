GetWinList()
{
	WinGet, ID, List
	winList := {}
	Loop, % ID
	{
		ID := ID%A_Index%
		WinGetTitle, Title, ahk_id %ID%
		If (InStr(Title, " - Creo Parametric"))
			winList.Insert({ id: ID, title: StrReplace(Title, " - Creo Parametric"), active: InStr(Title, "(Active)")})
	}
	DetectHiddenWindows, %DetectHiddenWindowsB%
	Return, winList
}