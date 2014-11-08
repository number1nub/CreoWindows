#NoEnv
#SingleInstance,Force
SetWorkingDir, %A_ScriptDir%
SetTitleMatchMode, 2
CoordMode, Mouse, Screen

if (A_IsCompiled)
	Menu, Tray, Icon, % A_ScriptFullPath, -159
else 
{
	if (!FileExist("CreoSwitch.ico"))
		UrlDownloadToFile, http://wsnhapps.com/apps/creoswitch/CreoSwitch.ico, CreoSwitch.ico
		If (ErrorLevel)
			FileDelete, CreoSwitch.ico
	Menu, Tray, Icon, % FileExist("CreoSwitch.ico") ? "CreoSwitch.ico" : ""
}

#IfWinActive, Creo Parametric

^Tab::
	curWin := WinExist("A")
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
return



^+Tab::
	MouseGetPos, mouseX
	creo := GetWinList()
	if (!creo.MaxIndex())
		return
	list := ""
	for c, win in creo
		list .= (list ? "|" : "") win.title

	Gui, CreoWins:+ToolWindow +AlwaysOnTop +Resize MinSize350x350	
	Gui, CreoWins:Font,  s22,  Segoe UI
	Gui, CreoWins:Add, Text, x10 y10 w600 h50, Creo Windows
	Gui, CreoWins:Font,  s14,  Segoe UI
	Gui, CreoWins:Add, ListBox, % "x10 y60 w600 h324 gwinList_Click vselWin AltSubmit Choose" GetActiveWin(creo).index,  %list%
	Gui, CreoWins:Add, Button, x260 y+5 w100 h50 Default vbtnActivate gActivateWin, Activate
	guiCenter := GetCenterCoords(619)
	Gui, CreoWins:Show, % "x " (mouseX > guiCenter.limit ? guiCenter.right : guiCenter.left) " w619",  Creo Window Switcher
return


winList_Click:
	if (A_GuiEvent = "DoubleClick")
	{
		ActivateWin:
		Gui, CreoWins:Submit
		Gui, CreoWins:Destroy
		newInd := switchTo(creo, selWin)
		if (selWin != GetActiveWin(creo).index)
			activate(creo[selWin].id)
		return
	}
return


CreoWinsGuiClose:
CreoWinsGuiEscape:
	Gui, CreoWins:Destroy
return


CreoWinsGuiSize:
	Anchor("selWin","wh")
	Anchor("btnActivate", "yx0.5")
return


#Include Activate.ahk
#Include Anchor.ahk
#Include GetWinList.ahk
#Include StrReplace.ahk
#Include SwitchTo.ahk
#Include GetActiveWin.ahk
#Include GetCenterCoords.ahk