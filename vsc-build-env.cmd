@echo off
setlocal EnableExtensions

:: Assume build environment is already setup if msbuild can be located
where msbuild >nul 2>nul && exit /b 0

:: Allow the path to vsdevcmd to be provided by our caller
if exist "%vsdevcmd%" (
    goto:$LaunchDevCmd
)
:: If we're still running, must be no vsdevcmd

if "%ProgramFiles(x86)%"=="" set ProgramFiles(x86)=%ProgramFiles%
set vswhere="%ProgramFiles(x86)%\Microsoft Visual Studio\Installer\vswhere.exe"
if not exist %vswhere% (
    echo vswhere.exe not found; unable to locate build tools.
    exit 1
)

:: This should work for Visual Studio
for /f "usebackq delims=" %%i in (`%vswhere% -latest -requires Microsoft.VisualStudio.Workload.NativeDesktop -find *\Tools\vsdevcmd.bat`) do (
    set "vsdevcmd=%%i"
    goto:$LaunchDevCmd
)

:: This should work with Visual Studio Build Tools
for /f "usebackq delims=" %%i in (`%vswhere% -latest -products * -requires Microsoft.VisualStudio.Workload.VCTools -find *\Tools\vsdevcmd.bat`) do (
    set "vsdevcmd=%%i"
    goto:$LaunchDevCmd
)

:: As a last resort, try without specifying the required workload
for /f "usebackq delims=" %%i in (`%vswhere% -latest -products * -find *\Tools\vsdevcmd.bat`) do (
    set "vsdevcmd=%%i"
    goto:$LaunchDevCmd
)

:: If we're still running, vsdevcmd wasn't executed
echo [ERROR] Unable to locate build tools.
exit 1

:$LaunchDevCmd
echo Found Visual Studio build tools: "%vsdevcmd%"
echo cmd /d /k "%vsdevcmd%"
cmd /d /k "%vsdevcmd%"
