switchTo(winList, ind)
{
	WinActivate, % "ahk_id " winList[ind].id
	WinWaitActive, % "ahk_id " winList[ind].id
}