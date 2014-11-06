#NoEnv
#SingleInstance,Force
SetTitleMatchMode, 2


#IfWinActive, Creo Parametric

^Tab::
{
	curWin := WinExist("A")a
	creo := GetWinList()
	if (!creo.MaxIndex())
		return
	active := GetActiveWin(creo)
	if (curWin = active.id)
	{
		newInd := switchTo(creo, (active.index < creo.MaxIndex() ? active.index + 1 : active.index - 1))
		activate(creo[newInd].id)
	}
	else
		activate()
}
return



^+Tab::
	creo := GetWinList()
	if (!creo.MaxIndex())
		return
	for c, win in creo
		list .= (list ? "|" : "") win.title
	Gui, +ToolWindow +AlwaysOnTop
	Gui, CreoWins:Font,  s22,  Segoe UI
	Gui, CreoWins:Add, Text, x10 y10 w600 h50, Creo Windows
	Gui, CreoWins:Font,  s14,  Segoe UI
	Gui, CreoWins:Add, ListBox, % "x10 y60 w600 h324 gwinList_Click vselWin AltSubmit Choose" GetActiveWin(creo).index,  %list%
	Gui, CreoWins:Show, w619 h394,  Creo Window Switcher
return


winList_Click:
	if (A_GuiEvent = "DoubleClick")
	{
		Gui, CreoWins:Submit
		Gui, CreoWins:Destroy
		newInd := switchTo(creo, selWin)
		activate(creo[selWin].id)
	}
return


CreoWinsGuiClose:
CreoWinsGuiEscape:
	Gui, CreoWins:Destroy
return




#Include activate.ahk
#Include GetCreoWins.ahk
#Include GetWinList.ahk
#Include StrReplace.ahk
#Include switchTo.ahk
#Include GetActiveWin.ahk