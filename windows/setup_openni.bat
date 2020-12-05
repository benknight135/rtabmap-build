@echo off
setlocal
:: set working directory to script directory
SET initcwd=%cd%
SET scriptpath=%~dp0
cd %scriptpath:~0,-1%

SET downloadfile=OpenNI-Windows-x64-2.2.0.33.exe
SET url=https://github.com/benknight135/openni_build/releases/download/v2.2/%downloadfile%
echo %url%

:: folder where download is placed
SET downloadfolder=%cd%\openni
:: full output filepath
SET downloadpath=%downloadfolder%\%downloadfile%

mkdir %downloadfolder%

:: download opencv from url
curl -o "%downloadpath%" -L %url%

:: extract self-exracting archive
%downloadpath% -o%downloadfolder% -y

:: delete downloaded file
del %downloadpath%

:: reset working directory
cd %initcwd%

endlocal