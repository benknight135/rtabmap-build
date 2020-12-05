@echo off
setlocal
:: set working directory to script directory
SET initcwd=%cd%
SET scriptpath=%~dp0
cd %scriptpath:~0,-1%

set vtk_version=9.0.1
set visual_studio_version="Visual Studio 15 2017 Win64"
set qt_path=C:\Qt\5.14.2\msvc2017_64

:: download vtk repo
git clone https://github.com/Kitware/VTK.git

:: checkout specific vtk version
cd VTK
git checkout tags/v%vtk_version%

:: clean build folder
set build_folder=%scriptpath:~0,-1%\VTK\build
set install_folder=%scriptpath:~0,-1%\VTK\install
:: create build folder
mkdir %build_folder%
mkdir %install_folder%

:: build vtk release
cd %build_folder%

cmake -G %visual_studio_version% ^
    -D CMAKE_BUILD_TYPE=RELEASE ^
    -D CMAKE_INSTALL_PREFIX=%install_folder% ^
    -D VTK_QT_VERSION=5 ^
    -D BUILD_SHARED_LIBS=ON ^
    -D BUILD_TESTING=OFF ^
    -D VTK_Group_Qt=ON ^
    -D VTK_GROUP_ENABLE_Qt=YES ^
    -D CMAKE_PREFIX_PATH=%qt_path% ..

:: install vtk release
cd %build_folder%
cmake --build . --config Release --target install --parallel 6 -j 6

:: reset working directory
cd %initcwd%

endlocal