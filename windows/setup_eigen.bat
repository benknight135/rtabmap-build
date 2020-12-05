@echo off
setlocal
:: set working directory to script directory
SET initcwd=%cd%
SET scriptpath=%~dp0
cd %scriptpath:~0,-1%

set eigen_version=3.3.9

:: download eigen repo
git clone https://gitlab.com/libeigen/eigen.git

:: checkout specific eigen version
cd eigen
git checkout tags/%eigen_version%

:: reset working directory
cd %initcwd%

endlocal