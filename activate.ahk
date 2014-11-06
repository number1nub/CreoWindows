activate(win="")
{
	if (win)
		WinActivate, ahk_id %win%
	Send, {Blind}!va
}