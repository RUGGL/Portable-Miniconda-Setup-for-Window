@echo off
setlocal EnableDelayedExpansion

cd /D "%~dp0"

set SCRIPT_DIR=%CD%
set INSTALL_DIR=%SCRIPT_DIR%\installer_files
set CONDA_ROOT_PREFIX=%INSTALL_DIR%\Miniconda
set ENV_DIR=%SCRIPT_DIR%\installer_files\Env
set CONDARC=%CONDA_ROOT_PREFIX%\.condarc
set MINICONDA_DOWNLOAD_URL=https://repo.anaconda.com/miniconda/Miniconda3-py310_23.11.0-2-Windows-x86_64.exe

echo Creating installation directory...
if exist "%INSTALL_DIR%" rmdir /s /q "%INSTALL_DIR%"
mkdir "%INSTALL_DIR%"
if not exist "%ENV_DIR%" mkdir "%ENV_DIR%"

echo Downloading Miniconda...
echo URL: %MINICONDA_DOWNLOAD_URL%

:: Try multiple download methods until one works
powershell -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; try { Invoke-WebRequest -Uri '%MINICONDA_DOWNLOAD_URL%' -OutFile '%INSTALL_DIR%\miniconda_installer.exe' -UseBasicParsing; exit 0 } catch { exit 1 }"
if %ERRORLEVEL% NEQ 0 (
    echo PowerShell download failed, trying CURL...
    curl -L "%MINICONDA_DOWNLOAD_URL%" -o "%INSTALL_DIR%\miniconda_installer.exe"
)

if not exist "%INSTALL_DIR%\miniconda_installer.exe" (
    echo CURL download failed, trying certutil...
    echo %MINICONDA_DOWNLOAD_URL% > "%INSTALL_DIR%\download_url.txt"
    certutil -urlcache -split -f @"%INSTALL_DIR%\download_url.txt" "%INSTALL_DIR%\miniconda_installer.exe"
    del "%INSTALL_DIR%\download_url.txt"
)

if not exist "%INSTALL_DIR%\miniconda_installer.exe" (
    echo All download methods failed.
    echo.
    echo Please download the installer manually from:
    echo %MINICONDA_DOWNLOAD_URL%
    echo.
    echo Then place it in: %INSTALL_DIR%\miniconda_installer.exe
    goto end
)

echo Downloaded file size:
for %%A in ("%INSTALL_DIR%\miniconda_installer.exe") do echo %%~zA bytes

echo Installing Miniconda...
start /wait "" "%INSTALL_DIR%\miniconda_installer.exe" /InstallationType=JustMe /NoShortcuts=1 /AddToPath=0 /RegisterPython=0 /NoRegistry=1 /S /D=%CONDA_ROOT_PREFIX%

if not exist "%CONDA_ROOT_PREFIX%\_conda.exe" (
    echo Miniconda installation failed.
    goto end
)

del "%INSTALL_DIR%\miniconda_installer.exe"

echo Creating portable configuration...
echo envs_dirs: > "%CONDARC%"
echo   - %ENV_DIR% >> "%CONDARC%"
echo pkgs_dirs: >> "%CONDARC%"
echo   - %INSTALL_DIR%\conda\pkgs >> "%CONDARC%"

echo Testing setup...
call "%CONDA_ROOT_PREFIX%\_conda.exe" config --file "%CONDARC%" --show envs_dirs

echo.
echo ===================================================================
echo Portable Miniconda setup complete!
echo ===================================================================
echo.

:end
pause