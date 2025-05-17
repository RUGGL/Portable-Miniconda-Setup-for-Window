@echo off
setlocal
cd /D "%~dp0"

set Miniconda=%CD%\installer_files\Miniconda
set Conda=%CD%\installer_files\Miniconda\_CONDA.exe
set Scripts=%CD%\installer_files\Miniconda\Scripts
set Bin=%CD%\installer_files\Miniconda\Library\bin 
set CONDA_ENVS_PATH=%CD%\installer_files\Env
set ENV_DIR=%CD%\installer_files\Env

:: Set the path temporarily for this session
set PATH=%Miniconda%;%Miniconda%\condabin;%Scripts%;%Bin%;%PATH%

:: Display information and open command prompt
cmd.exe /K "echo Portable Conda Environment & echo Envs at %CD%\installer_files\Env & echo. & echo Create Env: conda create --name ^<env_name^> python=^<version^> & echo Use Env: conda activate ^<env_name_here^> & echo. & echo Examples: & echo conda create --name WebUI python=3.10.13 & echo conda activate WebUI & echo conda install -c nvidia/label/cuda-12.1.0 cuda & title Conda CMD"