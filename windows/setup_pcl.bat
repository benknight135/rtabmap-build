@echo off
setlocal
:: set working directory to script directory
SET initcwd=%cd%
SET scriptpath=%~dp0
cd %scriptpath:~0,-1%

set pcl_version=1.8.1

:: download opencv repo
git clone https://github.com/PointCloudLibrary/pcl.git

:: checkout specific pcl version
cd pcl
git checkout tags/pcl-%pcl_version%

:: clean build folder
set build_folder=%scriptpath:~0,-1%\pcl\build
:: create build folder
mkdir %build_folder%

:: build opencv release
cd %build_folder%

@REM cmake -G !visual_studio_version! ^
@REM     -D CMAKE_BUILD_TYPE=RELEASE ^
@REM     -D CMAKE_INSTALL_PREFIX=!install_release_folder! ^
@REM     -D BUILD_opencv_world=!cmake_build_world! ^
@REM     -D WITH_CUDA=!cmake_with_cuda! ^
@REM     -D ENABLE_FAST_MATH=!cmake_enable_fast_math! ^
@REM     -D CUDA_FAST_MATH=!cmake_cuda_fast_math! ^
@REM     -D WITH_CUBLAS=!cmake_with_cublas! ^
@REM     -D INSTALL_PYTHON_EXAMPLES=!cmake_build_python_release_examples! ^
@REM     -D OPENCV_EXTRA_MODULES_PATH=!cmake_extra_modules_path! ^
@REM     -D BUILD_opencv_python=!cmake_python_release! ^
@REM     -D BUILD_opencv_python3=!cmake_python_release! ^
@REM     -D BUILD_opencv_python2=!cmake_python_release! ^
@REM     -D BUILD_EXAMPLES=!cmake_build_examples! ^
@REM     !cmake_addition_build_options! ..\..

:: install opencv release
@REM cd !build_release_folder!
@REM cmake --build . --config Release --target install --parallel 6 -j 6

:: reset working directory
cd %initcwd%

endlocal