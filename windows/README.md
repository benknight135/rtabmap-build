# RTABMAP Windows Build
Helpful scripts for building RTAB-Map and it's 3rdparty dependencies.

## Instructions
The automated scripts in this repository expect the following to already be installed:
- CMake 3+
- Visual Studio 15 2017 Win64
- Qt v5.14.2 (requires manual install of Qt x64 msvc2017 to 'C:\Qt\5.14.2\msvc2017_64')
- CUDA Toolkit v11.1 (requires manual install to 'cuda' folder until I find a way to automated this)

Will try to automate Qt and CUDA installs in future but for now this is difficult due to the way they organise their installers making it not possible to set the install directory.

Once the manual packages are installed use the automated scripts to install all the other libraries and RTAB-Map.
To make things simple a single script is provided that will run all the other setup scripts:
```
setup_all.bat
```
This will install the following depencies:
- boost v1.74.0
- eigen v3.3.9
- flann v1.9.1
- OpenCV v4.5.0 (built with CUDA v11.1)
- openni v2.2.0.33
- qhull v8.0.2
- vtk v8.2.0 (with QT v5.14.2)
- zlib v1.2.11
- pcl v1.8.1 (depends on all previous being installed first)

Then RTAB-Map will be installed (rtabmap v0.20.2)