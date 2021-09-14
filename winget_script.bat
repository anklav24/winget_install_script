ECHO OFF
CLS

set DateNow=%DATE:~6,4%-%DATE:~3,2%-%DATE:~0,2%
set TimeNow=%TIME:~0,2%-%TIME:~3,2%-%TIME:~6,2%
set TimeNow=%TimeNow: =0%

ECHO winget script v0.1
ECHO Aleksandr Lobanov 
ECHO anklav24@gmail.com
ECHO 2020
ECHO.
ECHO "%~dp0"
CD %~dp0
ECHO.

IF NOT EXIST "%~n0.txt" ECHO Perhaps the %~n0.txt is empty.
IF NOT EXIST "%~n0.txt" ECHO Add at a next rows your program names. One name at a line.>"%~n0.txt"
IF EXIST "%~n0.txt" ECHO If nothing is happens check the %~n0.txt
ECHO.

FOR /F "eol=; skip=1" %%I IN (%~n0.txt) DO (

ECHO %%I
winget install %%I  2>>%~n0.log

TIMEOUT 10
if %ERRORLEVEL% EQU 0 ECHO %DateNow%_%TimeNow%: %%I installed successfully.
if %ERRORLEVEL% NEQ 0 ECHO %DateNow%_%TimeNow%: %%I ERROR.
if %ERRORLEVEL% EQU 0 ECHO %DateNow%_%TimeNow%: %%I installed successfully.>> %~n0.log
if %ERRORLEVEL% NEQ 0 ECHO %DateNow%_%TimeNow%: %%I ERROR.>> %~n0.log
ECHO.
)

ECHO.
PAUSE
