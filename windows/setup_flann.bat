@echo off
setlocal
:: set working directory to script directory
SET initcwd=%cd%
SET scriptpath=%~dp0
cd %scriptpath:~0,-1%

set flann_version=1.9.1
set visual_studio_version="Visual Studio 15 2017 Win64"

:: download flann repo
git clone https://github.com/mariusmuja/flann.git

:: checkout specific flann version
cd flann
git checkout tags/%flann_version%

:: clean build folder
set build_folder=%scriptpath:~0,-1%\flann\build
set install_folder=%scriptpath:~0,-1%\flann\install
:: create build folder
mkdir %build_folder%
mkdir %install_folder%

:: build flann release
cd %build_folder%

cmake -G %visual_studio_version% ^
    -D CMAKE_BUILD_TYPE=RELEASE ^
    -D CMAKE_INSTALL_PREFIX=%install_folder% ..

:: install flann release
cd %build_folder%
cmake --build . --config Release --target install --parallel 6 -j 6

:: reset working directory
cd %initcwd%

endlocal