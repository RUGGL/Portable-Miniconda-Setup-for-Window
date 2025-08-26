# 🚀 Portable Miniconda Setup for Windows 🪟

This project provides Windows batch scripts to create a **portable, self-contained Miniconda environment** that you can use anywhere. Move the entire `installer_files` folder to any location (e.g., a USB drive) and run `SetEnv.bat` to update paths and retain functionality.

---

## 📖 Table of Contents

- [Features](#-features)
- [Prerequisites](#-prerequisites)
- [Scripts Overview](#-scripts-overview)
- [Installation Guide](#-installation-guide)
- [Usage Instructions](#-usage-instructions)
- [Why Use Conda?](#-why-use-conda)
- [Technical Details](#-technical-details)
- [Portability Notes](#-portability-notes)
- [Troubleshooting](#-troubleshooting)
- [FAQ](#-faq)
- [Credits](#-credits)

## ✨ Features

- **Portable**: Run Miniconda from any directory without system-wide installation.
- **Automated Setup**: Scripts handle downloading, installing, and configuring Miniconda.
- **Organized Structure**: Environments and packages are stored in dedicated folders.
- **Relocatable**: Move the installation folder and reconfigure paths with `SetEnv.bat`.
- **Flexible Python Versions**: Create environments with your choice of Python versions and packages (e.g., CUDA support).
- **User-Friendly**: Pre-configured `Cmd.bat` for seamless Conda management.

## 🛠️ Prerequisites

- **Operating System**: Windows 64-bit.
- **Internet Connection**: Required for downloading Miniconda during setup.
- **Disk Space**: At least 2 GB free for Miniconda and environments.
- **Important**: Keep batch scripts **outside** the `installer_files` folder to avoid issues.

## 📜 Scripts Overview

1. **`GetConda.bat`** 🛠️  
   - Downloads and installs Miniconda to `..\Miniconda`.  
   - Creates `installer_files`, `..\Miniconda`, and `..\Environments`.  
   - Deletes the installer after setup to save space.  
   - Configures a portable `.condarc` file for environment and package paths.

2. **`SetEnv.bat`** ⚙️  
   - Updates the `.condarc` file with the current directory’s environment and package paths.  
   - Run this after moving the `installer_files` folder to a new location.

3. **`Cmd.bat`** 💻  
   - Opens a command prompt with pre-configured Conda paths.  
   - Displays helpful commands for creating and activating environments.

## 📦 Installation Guide

1. **Download the Repository** 📥  
   - Creates the `Miniconda` directory.  

   - Clone this repository in `Miniconda`  directory or download and extract the ZIP file to your desired location.
   
   - we get dir like this in the end
   
   
   
 ```
Miniconda/
├── Portable-Miniconda-Setup-for-Window
│   ├── GetConda.bat
│   │   SetEnv.bat
│   │   Cmd.bat
│   │   README.md
│   └── .git/
│
├── installer_files
│   └── miniconda_installer.exe
│
├── Environments
│   └──.condarc
│
└── Miniconda
    ├── _conda.exe
    └── ...   
 ```


​     

2. **Run `GetConda.bat`** 🚀  
   - Double-click `GetConda.bat` or run it from a command prompt.  
   - This script:  
     - Creates the `Miniconda` directory.  
     - Downloads Miniconda (Python 3.10.13 by default).  
     - Installs it to `Miniconda\Miniconda`.  
     - Sets up `Miniconda\Environments` for environments and `Miniconda\Miniconda\pkgs` for packages.  
     - Configures the `.condarc` file.

3. **Run `SetEnv.bat`** ⚙️  
   - Execute `SetEnv.bat` to update the `.condarc` file with correct paths.

4. **Use `Cmd.bat`** 💻  
   - Run `Cmd.bat` to open a command prompt with Conda pre-configured.

> **Note**: Always keep batch scripts **outside** the `installer_files` folder.

## 🖥️ Usage Instructions

Manage Conda environments using the command prompt opened by `Cmd.bat`.

### Creating a New Environment 🆕
```bash
conda create --name <env_name> python=<version>
```
**Example**:
```bash
conda create --name WebUI python=3.10.9
```

### Activating an Environment ✅
```bash
conda activate <env_name>
```
**Example**:
```bash
conda activate WebUI
```

### Installing Packages 📦
Install packages like PyTorch with CUDA support.  
**Example**:
```bash
conda install pytorch==2.5.0 torchvision==0.20.0 pytorch-cuda=12.4 -c pytorch -c nvidia
```

> **Warning**: Ensure your GPU supports the CUDA version. Check compatibility at [NVIDIA’s CUDA GPUs page](https://developer.nvidia.com/cuda-gpus).

### Deactivating an Environment ⏹️
```bash
conda deactivate
```

### Updating Miniconda
To update Miniconda or packages:
```bash
conda update conda
conda update --all
```

> **Tip**: Always work in a named environment to keep packages isolated and avoid polluting the global cache.

## 🌟 Why Use Conda?

Conda is a versatile package and environment manager ideal for:

- **Isolated Environments**: Prevent package conflicts across projects.
- **Cross-Platform**: Supports Windows, macOS, and Linux.
- **Non-Python Packages**: Install tools like R, CUDA, or compilers.
- **Flexible Channels**: Access packages from `conda-forge`, `nvidia`, etc.
- **Portable**: This setup allows use on USB drives or shared systems.

Use Conda for:
- Data science (NumPy, Pandas, Jupyter).
- Machine learning (TensorFlow, PyTorch, CUDA).
- Scientific computing (SciPy, Matplotlib).
- Multiple Python versions.

## 🔍 Technical Details

- **Miniconda Version**: Installs Miniconda3-py310_23.11.0-2 (Python 3.10.13, 64-bit). Update using `conda update conda`.
- **Folder Structure**:  
  - `installer_files\Miniconda`: Miniconda installation.  
  - `installer_files\Environments`: Conda environments.  
  - `installer_files\Miniconda\pkgs`: Package cache.  
- **Configuration**: The `.condarc` file ensures portable environment and package paths.
- **Download Method**: `GetConda.bat` uses CURL for reliable downloads.
- **Path Management**: `Cmd.bat` sets temporary paths for the session, avoiding system-wide changes.

> **Cache Growth Warning**: Installing multiple CUDA versions or large toolkits across environments can significantly increase the `installer_files\Miniconda\pkgs` folder size. Use a single, stable toolkit version when possible.

## 📍 Portability Notes

- **Relocating the Installation**: Move `installer_files` anywhere, then run `SetEnv.bat` to update paths in `.condarc`.
- **Package Cache**: Packages in `installer_files\Miniconda\pkgs` persist across environment recreations unless manually deleted.

## 🛠️ Troubleshooting

- **Download Fails**:  
  - Manually download Miniconda from [miniconda](https://docs.conda.io/en/latest/miniconda.html) and place it in `installer_files\miniconda_installer.exe`.
- **Environment Not Found**:  
  - Run `SetEnv.bat` after moving `installer_files`.  
  - Check `.condarc` in `installer_files\Miniconda` for correct paths.
- **Command Not Recognized**:  
  - Use the prompt opened by `Cmd.bat` to ensure Conda paths are set.
- **Scripts Not Working**:  
  - Ensure batch scripts are **outside** `installer_files`.

## ❓ FAQ

- **Can I use a different Python version?**  
  Yes, specify the version when creating an environment (e.g., `conda create --name myenv python=3.9`).
- **How do I reduce cache size?**  
  Run `conda clean --all` to remove unused packages and caches.
- **Can I use this on a USB drive?**  
  Yes, move `installer_files` to the USB and run `SetEnv.bat` to update paths.

## 🙌 Credits

- **Author**: VOIID – For creating this portable Miniconda script. 🙏
- **Conda Team**: Thanks to the Conda developers and open-source community. 🌍
- **Anaconda**: For providing Miniconda and maintaining the package ecosystem. 🚀

Happy coding with your portable Conda environment! 🎉
