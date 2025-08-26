@echo off
setlocal enabledelayedexpansion

rem Get the current directory
cd /D "%~dp0"
::出于个人喜好,miniconda安装目录在脚本文件夹外部
cd ..
set "current_dir=%cd%"

rem Create or overwrite the .condarc file with the actual paths
echo envs_dirs: > "%current_dir%\Miniconda\.condarc"
echo   - %current_dir%\Environments >> "%current_dir%\Miniconda\.condarc"
echo pkgs_dirs: >> "%current_dir%\Miniconda\.condarc"
echo   - %current_dir%\Miniconda\pkgs >> "%current_dir%\Miniconda\.condarc"

echo .condarc file has been updated with the following paths:
echo Environment directory: %current_dir%\Environments
echo Packages directory: %current_dir%\Miniconda\pkgs

pause