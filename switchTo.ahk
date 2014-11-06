switchTo(win, ind="")
{
	static lastInd
	if (IsObject(win))
		WinActivate, % "ahk_id " win[ind].id
	else
		WinActivate, ahk_id %win%
	return (lastInd := ind)
}