@echo off
set PROMPT=()$G
setlocal
cd /D "%~dp0"

set Miniconda=%CD%\installer_files\Miniconda
set Scripts=%CD%\installer_files\Miniconda\Scripts
set Bin=%CD%\installer_files\Miniconda\Library\bin 
set Conda=%CD%\installer_files\Miniconda\_CONDA.exe


:: Set the path temporarily for this session
set PATH=%Miniconda%;%Miniconda%\condabin;%Scripts%;%Bin%;%PATH%

:: Display information and Open command prompt
cmd.exe /K "echo Portable Miniconda  &echo Envs at %CD%\installer_files\Environments &echo Miniconda Pkgs at %CD%\installer_files\Conda\pkgs & title Miniconda CMD"