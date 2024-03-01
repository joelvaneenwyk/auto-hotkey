@echo off
goto:$Main

:LogCommand
setlocal EnableDelayedExpansion
    set "_log=%~1"
    shift
    set "_command=%1 %2 %3 %4 %5 %6 %7 %8 %9"
    set "_command=!_command:   = !"
    set "_command=!_command:  = !"
    echo ##[cmd] !_command!
    call !_command! >"!_log!" 2>&1
exit /b %errorlevel%

:Build
    set "root=%~dp1"
    if "%root:~-1%"=="\" set "root=%root:~0,-1%"
    call :LogCommand ^
        "%root%\.build\devenv_log.txt" ^
        "%root%\source\scripts\vsdev.cmd" devenv "%root%\AutoHotkeyx.sln" /Build
    call :LogCommand ^
        "%root%\.build\msbuild_log.txt" ^
        "%root%\source\scripts\vsdev.cmd" msbuild /m /t:Rebuild /p:Configuration="Release" /p:Platform="x64" "%root%\AutoHotkeyx.sln"
exit /b

:$Main
setlocal
    call :Build "%~dp0\"
endlocal & exit /b %ERRORLEVEL%
