StrReplace(in, stxt, rep="", firstOnly="")
{
	StringReplace, retVal, in, %stxt%, %rep%, % firstOnly ? "" : "All"
	return retVal
}