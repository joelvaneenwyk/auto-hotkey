@echo off
goto:$Main

:$Main
setlocal
    msbuild /m /p:Configuration="Release" /p:Platform="x64" "%~dp0..\AutoHotkeyx.sln"
endlocal & exit /b %ERRORLEVEL%
