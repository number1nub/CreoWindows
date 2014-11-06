#NoEnv
#SingleInstance,Force
SetTitleMatchMode, 2


#IfWinActive, Creo Parametric

^Tab::
{
	curWin := WinExist("A")
	wList  := GetWinList()
	
	creo := GetWinList()
	ShowWins(creo)
	
	if (inActive)
	{
		switchTo(creoWins, (activeInd < creoWins.MaxIndex() ? curInd++ : curInd--))
		activate()
	}
	else
		activate()
}
return




#Include activate.ahk
#Include GetCreoWins.ahk
#Include GetWinList.ahk
#Include ShowWins.ahk
#Include StrReplace.ahk
#Include switchTo.ahk



;_________________________________

