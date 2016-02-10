'on error resume next

'==========================================================================
' La siguiente funcion devuelve el espacio disponible en una unidad
' 
'==========================================================================

Function GetFreeSpaceGB(ByVal drvPath) 
    Dim objFSo, d 
    Set objFSo  = CreateObject("Scripting.FileSystemObject") 
    If Not objFSO.FolderExists(drvPath) Then 
       ' return zero if the folder doesn't exist
       GetFreeSpaceGB = 0
       Exit Function
    End If
    Set d = objFSo.GetDrive(objFSo.GetDriveName(drvPath)) 
    GetFreeSpaceGB = d.FreeSpace/ (1024 * 1024 * 1024)
End Function 

'==========================================================================
' La siguiente funcion devuelve el espacio total en una unidad
' 
'==========================================================================

Function GetTotalSpaceGB(ByVal drvPath) 
    Dim objFSo, d 
    Set objFSo  = CreateObject("Scripting.FileSystemObject") 
    If Not objFSO.FolderExists(drvPath) Then 
       ' return zero if the folder doesn't exist
       GetTotalSpaceGB = 0
       Exit Function
    End If
    Set d = objFSo.GetDrive(objFSo.GetDriveName(drvPath)) 
    GetTotalSpaceGB = d.TotalSize/ (1024 * 1024 * 1024)
End Function


Function Help() 
    WScript.Echo "Ayuda: Devuelve el espacio total, usado y libre de una unidad local"
	WScript.Echo "  ejemplo: cscript df3.vbs c: //nologo"
End Function

' Revisar argumentos
set args = WScript.Arguments
' Parse args
select case args.Count
case 0
    Help
case 1
	sRuta = args(0)
    WScript.Echo sRuta & " Tot: " & Round(GetTotalSpaceGB(sRuta)) & " Gb Fr: " & Round(GetFreeSpaceGB(sRuta)) & " Gb Us: " & Round(GetTotalSpaceGB(sRuta) - GetFreeSpaceGB("C:")) &  " Gb"
case 2
    Help
case 3
	Help
case 4
	Help
case 5
	Help
case 6
	sRuta = args(0)
	iPxinicio = CInt(args(2))
	iPyinicio = CInt(args(3))
	iBLong = CInt(args(4))
	iBAnch = CInt(args(5))
	' -fill green -draw "rectangle 100,100,200,120" -fill red -draw "rectangle 100,100,180,120"
    If args(1) = "B" Then 
       ' return zero if the folder doesn't exist
	   ' largo - val
	   ' tot - free
       largo = iBLong
	   TotSpGb  = GetTotalSpaceGB(sRuta)
	   FreeSpGb = GetFreeSpaceGB(sRuta)
	   largop = Round((largo * FreeSpGb) / TotSpGb)
	   'WScript.Echo " rectangle " & Round(iPxinicio) & "," & Round(iPyinicio) & "," & (iPxinicio + largop) & "," & (iPxinicio + iBAnch)
	   WScript.Echo "-fill green -draw " & chr(34) & "rectangle " & Round(iPxinicio) & "," & Round(iPyinicio) & "," & Round(iPxinicio + iBLong) & "," & Round(iPyinicio + iBAnch) & chr(34) & "  -fill red -draw " & chr(34) & "rectangle " & Round(iPxinicio) & "," & Round(iPyinicio) & "," & Round(iPxinicio + largop) & "," & Round(iPyinicio + iBAnch) & chr(34)
    End If
	If args(1) = "B2" Then 
       ' return zero if the folder doesn't exist
	   ' largo - val
	   ' tot - free
       largo = iBLong
	   TotSpGb  = GetTotalSpaceGB(sRuta)
	   FreeSpGb = GetFreeSpaceGB(sRuta)
	   largop = Round((largo * FreeSpGb) / TotSpGb)
	   'WScript.Echo " rectangle " & Round(iPxinicio) & "," & Round(iPyinicio) & "," & (iPxinicio + largop) & "," & (iPxinicio + iBAnch)
	   WScript.Echo "-fill black -draw " & chr(34) & "roundrectangle " & Round(iPxinicio) & "," & Round(iPyinicio) & "," & Round(iPxinicio + iBLong) & "," & Round(iPyinicio + iBAnch) & ",2,2" & chr(34) & " -fill gray -draw " & chr(34) & " roundrectangle " & Round(iPxinicio + 2) & "," & Round(iPyinicio + 2 ) & "," & Round(iPxinicio + iBLong - 2) & "," & Round(iPyinicio + iBAnch - 2) & ",2,2" & chr(34) & " -fill blue -draw " & chr(34) & "roundrectangle " & Round(iPxinicio + 2) & "," & Round(iPyinicio + 2) & "," & Round(iPxinicio + largop - 2) & "," & Round(iPyinicio + iBAnch - 2) & ",2,2" & chr(34) & " -fill black -draw " & chr(34) & " font Arial font-size 12 text " & Round(iPxinicio + 2) & "," & Round(iPyinicio + 26) & " '" & sRuta & " Dispon " & Round(FreeSpGb) & "Gb de " & Round(TotSpGb) & "Gb'" & chr(34)
    End If
case 7
	sRuta = args(0)
	iPxinicio = CInt(args(2))
	iPyinicio = CInt(args(3))
	iBLong = CInt(args(4))
	iBAnch = CInt(args(5))
	percent = CInt(args(6)) 'Porcentage usado
	' -fill green -draw "rectangle 100,100,200,120" -fill red -draw "rectangle 100,100,180,120"
    If args(1) = "B" Then 
       ' return zero if the folder doesn't exist
	   ' iblong - val_?
	   ' 100 - percent
	   largop = Round((iBLong * percent) / 100)
	   WScript.Echo "-fill green -draw " & chr(34) & "rectangle " & Round(iPxinicio) & "," & Round(iPyinicio) & "," & Round(iPxinicio + iBLong) & "," & Round(iPyinicio + iBAnch) & chr(34) & "  -fill red -draw " & chr(34) & "rectangle " & Round(iPxinicio) & "," & Round(iPyinicio) & "," & Round(iPxinicio + largop) & "," & Round(iPyinicio + iBAnch) & chr(34)
    End If
	'-fill black -draw "roundrectangle 100,100,200,115,2,2" -fill white -draw "roundrectangle 102,102,198,113,2,2" -fill green -draw "roundrectangle 102,102,148,113,2,2" -fill black -draw "font Arial font-size 12 text 102,126 'C: Dispn 4Gg de 8Gb'"
	If args(1) = "B2" Then 
       ' return zero if the folder doesn't exist
	   ' iblong - val_?
	   ' 100 - percent
	   largop = Round((iBLong * percent) / 100)
	   WScript.Echo "-fill black -draw " & chr(34) & "roundrectangle " & Round(iPxinicio) & "," & Round(iPyinicio) & "," & Round(iPxinicio + iBLong) & "," & Round(iPyinicio + iBAnch) & ",2,2" & chr(34) & "  -fill green -draw " & chr(34) & "roundrectangle " & Round(iPxinicio + 2) & "," & Round(iPyinicio + 2) & "," & Round(iPxinicio + largop - 2) & "," & Round(iPyinicio + iBAnch - 2) & ",2,2" & chr(34)
    End If
end select


