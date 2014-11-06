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
	ShowWins(creo)
return





#Include activate.ahk
#Include GetCreoWins.ahk
#Include GetWinList.ahk
#Include ShowWins.ahk
#Include StrReplace.ahk
#Include switchTo.ahk
#Include GetActiveWin.ahk