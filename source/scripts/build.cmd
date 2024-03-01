@echo off
goto:$Main

:$Main
setlocal
    set "root=%~dp0..\.."
    call "%root%\vsc-build-env.cmd"
    devenv "%root%\AutoHotkeyx.sln" /Build >"%root%\.build\devenv_log.txt" 2>&1
    msbuild /m /t:Rebuild /p:Configuration="Release" /p:Platform="x64" "%root%\AutoHotkeyx.sln" >"%root%\.build\msbuild_log.txt" 2>&1
endlocal & exit /b %ERRORLEVEL%
