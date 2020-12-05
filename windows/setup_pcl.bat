@echo off
setlocal
:: set working directory to script directory
SET initcwd=%cd%
SET scriptpath=%~dp0
cd %scriptpath:~0,-1%

set pcl_version=1.8.1
set visual_studio_version="Visual Studio 15 2017 Win64"
set boost_path=%scriptpath:~0,-1%\boost_1_66_0
set eigen_path=%scriptpath:~0,-1%\eigen
set flann_path=%scriptpath:~0,-1%\flann\install
set vtk_path=%scriptpath:~0,-1%\VTK\install
set qhull_path=%scriptpath:~0,-1%\qhull\install
set zlib_path=%scriptpath:~0,-1%\zlib-1.2.11\install
set openni_path=%scriptpath:~0,-1%\openni

:: download opencv repo
git clone https://github.com/PointCloudLibrary/pcl.git

:: checkout specific pcl version
cd pcl
git checkout tags/pcl-%pcl_version%

:: clean build folder
set build_folder=%scriptpath:~0,-1%\pcl\build
set install_folder=%scriptpath:~0,-1%\pcl\install
:: create build folder
mkdir %build_folder%
mkdir %install_folder%

:: build pcl release
cd %build_folder%

cmake -G %visual_studio_version% ^
    -D CMAKE_BUILD_TYPE=RELEASE ^
    -D Boost_INCLUDE_DIR=%boost_path% ^
    -D EIGEN_INCLUDE_DIR=%eigen_path% ^
    -D VTK_DIR=%vtk_path%\lib\cmake\vtk-9.0 ^
    -D ZLIB_ROOT=%zlib_path% ^
    -D QHULL_ROOT=%qhull_path% ^
    -D FLANN_ROOT=%flann_path% ^
    -D CMAKE_INSTALL_PREFIX=%install_folder% ..

:: install pcl release
cd %build_folder%
cmake --build . --config Release --target install --parallel 6 -j 6

:: reset working directory
cd %initcwd%

endlocal