@echo off

SETLOCAL EnableDelayedExpansion
:: set working directory to script directory
SET initcwd=%cd%
SET scriptpath=%~dp0
cd %scriptpath:~0,-1%

set filename=cuda_11.1.1_win10_network.exe
wget https://developer.download.nvidia.com/compute/cuda/11.1.1/network_installers/%filename%
echo Install CUDA toolkit to %scriptpath:~0,-1%\cuda
%filename%

del %filename%
:: reset working directory
cd %initcwd%

EXIT /B %ERRORLEVEL%