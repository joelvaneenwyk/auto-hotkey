@echo off
goto:$Main

:$Main
setlocal
    devenv "%~dp0..\..\AutoHotkeyx.sln" /Build >"%~dp0..\..\.build\devenv_log.txt" 2>&1
    msbuild /m /t:Rebuild /p:Configuration="Release" /p:Platform="x64" "%~dp0..\..\AutoHotkeyx.sln" >"%~dp0..\..\.build\msbuild_log.txt" 2>&1
endlocal & exit /b %ERRORLEVEL%
