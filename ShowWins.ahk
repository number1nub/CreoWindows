ShowWins(winList)
{
	static selWin
	for c, win in winList
	{
		list .= (list ? "|" : "") win.title
		if win.active
			lbOpts := " Choose" A_Index
	}
	
	Gui, CreoWins:Font,  s22,  Segoe UI
	Gui, CreoWins:Add, Text, x10 y10 w600 h50, Creo Windows
	Gui, CreoWins:Font,  s14,  Segoe UI
	Gui, CreoWins:Add, ListBox, x10 y60 w600 h324 gwinList_Click vselWin AltSubmit %lbOpts%,  %list%
	Gui, CreoWins:Show, w619 h394,  Creo Window Switcher
	return
		
	winList_Click:
		if (A_GuiEvent = "DoubleClick")
		{
			Gui, CreoWins:Submit
			Gui, CreoWins:Destroy
			switchTo(winList, winList[selWin].id)
		}
	return
	
	CreoWinsGuiClose:
	CreoWinsGuiEscape:
		Gui, Destroy
	return
}