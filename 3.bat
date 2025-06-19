@echo off
setlocal enabledelayedexpansion

rem Configure these variables
set "FOLDER_PATH=C:\Users\admin\Downloads\duck"
set "CURL_CMD=curl -X PUT https://shamshukriya.shop/upload -F file=@"

rem Initialize counter
set /a counter=1

echo.
echo ----------------xxxxxxxx----------------

:loop
if !counter! GTR 5 (
    echo Reached 5 iterations. Exiting script.
    goto end
)

rem Process all files in the folder
for %%f in ("%FOLDER_PATH%\*.*") do (
    echo.
    echo [~] Uploading file !counter!: %%~nxf
    %CURL_CMD%"%%f"
    echo.
        
    set /a counter+=1

    rem Wait 30 seconds before processing the next file
    timeout /t 30 /nobreak > nul

    rem Check if counter exceeded 5 inside the loop as well
    if !counter! GTR 5 goto end
)

goto loop

:end
echo Script completed after 5 iterations.
pause
