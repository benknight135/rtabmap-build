@echo off

SETLOCAL EnableDelayedExpansion
:: set working directory to script directory
SET initcwd=%cd%
SET scriptpath=%~dp0
cd %scriptpath:~0,-1%
set zlib_version=1.2.11
SET "zlib_version_=%zlib_version:.=_%"

:: set default option values
set option_clean=false
set option_uninstall=false

:: find options in arguments
FOR %%a IN (%*) DO (
    set arg=%%a
    if "!arg!"=="--clean" (
        set option_clean=true
    )
    if "!arg!"=="--uninstall" (
        set option_clean=true
        set option_uninstall=true
    )
)

if "%option_clean%"=="true" (
    echo Cleaning directory...
    rmdir /Q /S zlib-%zlib_version%
)

if "%option_uninstall%"=="true" (
    exit /b %ERRORLEVEL%
)

:: download file
SET downloadfile=zlib-%zlib_version%.tar.gz
:: url for downloading opencv
SET url=http://www.zlib.net/%downloadfile%
echo %url%

:: folder where download is placed
SET downloadfolder=%cd%
:: full output filepath
SET downloadpath=%downloadfolder%\%downloadfile%

:: download opencv from url
curl -o "%downloadpath%" -L %url%

:: install boost in current directory
echo Extracting zlib...
tar -xf %downloadfile%

:: delete downloaded file
del %downloadfile%

:: build boost
set "zlib_install_path=%downloadfolder%\zlib-%zlib_version%\install"
SET "zlib_install_path_=%zlib_install_path:\=/%"

echo building zlib...
cd zlib-%zlib_version%
mkdir build
mkdir install
cd build
cmake -G"Visual Studio 14 2015 Win64" -DCMAKE_INSTALL_PREFIX=%zlib_install_path_% ..

echo installing zlib to %zlib_install_path%...
cmake --build . --config Release --target install

echo Zlib install complete.

:: reset working directory
cd %initcwd%

ENDLOCAL