# RTABMAP Windows dependencies

## Manual
- CMake 3+
- Qt v5.14.2 (requires manual install of Qt x64 msvc2017 to 'C:\Qt\5.14.2\msvc2017_64')
- CUDA Toolkit v11.1 (requires manual install to 'cuda' folder)

## Automated
- boost v1.74.0
- eigen v3.3.9
- flann v1.9.1
- OpenCV v4.5.0 (built with CUDA v11.1)
- openni v2.2.0.33
- qhull v8.0.2
- vtk v8.2.0 (with QT v5.14.2)
- zlib v1.2.11
- pcl v1.8.1 (depends on all previous being installed first)
- rtabmap v0.20.2 (depends on all previous being installed first)