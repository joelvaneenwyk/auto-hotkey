@echo off
goto:$Main

:LogCommand
setlocal EnableDelayedExpansion
    set "_log_dir=%root%\.build"
    set "_log=%_log_dir%\%~1_log.txt"
    set "_cmd_var=%~2"
    if not exist "!_log_dir!" mkdir "!_log_dir!"
    set "_command="%root%\source\scripts\vsdev.cmd" !%_cmd_var%!"
    set "_command=!_command:   = !"
    set "_command=!_command:  = !"
    echo ##[cmd] !_command!
    call !_command! >"!_log!" 2>&1
    type "!_log!"
exit /b %errorlevel%

:MSBuild
setlocal EnableExtensions
    set "sln=%~1"
    set "config=%~2"
    set "platform=%~3"
    set "_cmd=msbuild /m /t:Rebuild /p:Configuration="%config%" /p:Platform="%platform%" "%sln%""
    call :LogCommand msbuild _cmd
exit /b %ERRORLEVEL%

:DevEnv
setlocal EnableExtensions
    set "sln=%~1"
    set "_cmd=devenv "%root%\AutoHotkeyx.sln" /Build"
    call :LogCommand devenv _cmd
exit /b %ERRORLEVEL%

:Build
    set "root=%~dp1"
    if "%root:~-1%"=="\" set "root=%root:~0,-1%"
    if not exist "%root%\.build" mkdir "%root%\.build"
    call :DevEnv "%root%\AutoHotkeyx.sln"
    if errorlevel 1 goto :$BuildError

    call :MSBuild "%root%\AutoHotkeyx.sln" "Release" "x64"
    if errorlevel 1 goto :$BuildError
    echo Builds completed successfully.
    goto:$BuildDone

    :$BuildError
    echo Build error occurred. Check the logs for more information.
    goto:$BuildDone

    :$BuildDone
exit /b %ERRORLEVEL%

:$Main
setlocal EnableExtensions
    call :Build "%~dp0\"
endlocal & exit /b %ERRORLEVEL%
