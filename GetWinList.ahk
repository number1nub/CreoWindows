GetWinList()
{
	DetectHiddenWindowsB := A_DetectHiddenWindows
	DetectHiddenWindows, Off
	WinGet, ID, List
	winList := []
	Loop, % ID
	{
		ID := ID%A_Index%
		WinGetTitle, Title, ahk_id %ID%
		WinGetClass, Class, ahk_id %ID%
		If Title
			If (InStr(Title, " - Creo Parametric"))
			{
				winList.Insert({ id: ID
							   , title: StrReplace(Title, " - Creo Parametric")
							   , active: InStr(Title, "(Active)")})
			}
	}
	DetectHiddenWindows, %DetectHiddenWindowsB%
	Return, winList
}