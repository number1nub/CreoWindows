GetActiveWin(winObj)
{
	for ind, win in winObj
		if (win.active)
			return { id: win.id, title: win.title, index: A_Index }
}