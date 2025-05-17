# 🚀 Portable Miniconda Setup for Windows 🪟

Welcome to the **Portable Miniconda Setup** repository! This project provides a set of Windows batch scripts to create a portable, self-contained Miniconda environment that you can use anywhere. Whether you're a data scientist, developer, or machine learning enthusiast, this setup simplifies managing Python environments with Conda. 🌟

## 📖 Table of Contents

- Features
- Prerequisites
- Scripts Overview
- Installation Guide
- Usage Instructions
- Why Use Conda?
- Technical Details
- Portability Notes
- Troubleshooting
- Credits

## ✨ Features

- 🛠️ **Portable**: Run Miniconda from any directory without system-wide installation.
- ⚙️ **Automated Setup**: Scripts handle downloading, installing, and configuring Miniconda.
- 📂 **Organized Structure**: Environments and packages are neatly stored in dedicated folders.
- 🔄 **Relocatable**: Move the installation folder and reconfigure paths with ease.
- 🐍 **Flexible Python Versions**: Create environments with your choice of Python versions and packages (e.g., CUDA support).
- 🚀 **User-Friendly**: Pre-configured `cmd.bat` for seamless Conda management.

## 🛠️ Prerequisites

- Windows operating system (64-bit).
- Internet connection (for downloading Miniconda during setup).
- **Important**: Do **not** place or move the batch scripts inside the `installer_files` folder after running them.

## 📜 Scripts Overview

This repository includes three batch scripts for Windows:

1. **conda.bat** 🛠️

   - Downloads and installs Miniconda to `installer_files\Miniconda`.
   - Creates folders: `installer_files`, `installer_files\conda`, `installer_files\Env`.
   - Deletes the installer after setup to save space.
   - Configures a portable `.condarc` file for environment and package paths.

2. **env.bat** ⚙️

   - Updates the `.condarc` file in `installer_files\Miniconda` with the current directory's environment and package paths.
   - Run this script if you move the installation folder to a new location.

3. **cmd.bat** 💻

   - Opens a command prompt with pre-configured paths for Conda.
   - Displays helpful commands for creating and activating environments.
   - Simplifies Conda management without manual path configuration.

## 📦 Installation Guide

Follow these steps to set up your portable Miniconda environment:

1. **Clone or Download the Repository** 📥

   - Clone this repository or download the ZIP file and extract it to your desired location.
   - Example: `C:\Users\YourName\PortableConda`.

2. **Run** `conda.bat` 🚀

   - Double-click `conda.bat` or run it from a command prompt.
   - This script:
     - Creates the `installer_files` directory.
     - Downloads Miniconda (Python 3.10.13 by default).
     - Installs it to `installer_files\Miniconda`.
     - Sets up the `installer_files\Env` folder for environments.
     - Configures the `.condarc` file.

3. **Run** `env.bat` ⚙️

   - After `conda.bat` completes, run `env.bat`.
   - This updates the `.condarc` file with the correct paths for environments (`installer_files\Env`) and packages (`installer_files\conda\pkgs`).

4. **Use** `cmd.bat` 💻

   - Run `cmd.bat` to open a command prompt with Conda paths pre-configured.
   - The prompt displays example commands for creating and activating environments.

**Note**: Keep the batch scripts outside the `installer_files` folder at all times to avoid issues.

## 🖥️ Usage Instructions

Once installed, you can manage Conda environments using `cmd.bat`. Here’s how:

### Creating a New Environment 🆕

Use the `conda create` command to set up a new environment with your preferred Python version or packages.

```bash
conda create --name <env_name> python=<version>
```

**Example**:

```bash
conda create --name WebUI python=3.10.13
```

### Activating an Environment ✅

Activate your environment to start using it.

```bash
conda activate <env_name>
```

**Example**:

```bash
conda activate WebUI
```

### Installing Packages 📦

Install additional packages, such as CUDA for GPU support.

**Example**:

```bash
conda install -c nvidia/label/cuda-12.1.0 cuda
```

After installation, verify CUDA:

```bash
nvcc --version
```

**Sample Output**:

```
nvcc: NVIDIA (R) Cuda compiler driver
Copyright (c) 2005-2023 NVIDIA Corporation
Built on Wed_Feb__8_05:53:42_Coordinated_Universal_Time_2023
Cuda compilation tools, release 12.1, V12.1.66
Build cuda_12.1.r12.1/compiler.32415258_0
```

### Deactivating an Environment ⏹️

Return to the base environment.

```bash
conda deactivate
```

## 🌟 Why Use Conda?

Conda is a powerful package and environment manager that simplifies dependency management for Python and other languages. Here’s why it’s awesome:

- **Cross-Platform**: Works on Windows, macOS, and Linux.
- **Isolated Environments**: Create separate environments for different projects to avoid package conflicts.
- **Non-Python Support**: Install non-Python packages like R, CUDA, or compilers.
- **Flexible Channels**: Access packages from channels like `conda-forge` or `nvidia`.
- **Portable**: This setup makes Conda fully portable, ideal for USB drives or shared systems.

Conda is perfect for:

- Data science (e.g., NumPy, Pandas, Jupyter).
- Machine learning (e.g., TensorFlow, PyTorch, CUDA).
- Scientific computing (e.g., SciPy, Matplotlib).
- Development with multiple Python versions.

## 🔍 Technical Details

- **Miniconda Version**: The scripts download Miniconda3-py310_23.11.0-2 for Windows (64-bit), which includes Python 3.10.13 by default.
- **Folder Structure**:
  - `installer_files\Miniconda`: Miniconda installation.
  - `installer_files\Env`: Conda environments.
  - `installer_files\conda\pkgs`: Package cache.
- **Download Methods**: `conda.bat` tries PowerShell, CURL, and CertUtil to ensure reliable downloads.
- **Configuration**: The `.condarc` file is customized to store environments and packages locally, making the setup portable.
- **Path Management**: `cmd.bat` temporarily sets paths for the session, avoiding system-wide changes.

## 📍 Portability Notes

This setup is designed to be portable, but there are a few things to keep in mind:

- **Moving the Installation** 📦

  - If you move the installation folder (e.g., to a USB drive), run `env.bat` to update the `.condarc` file with the new paths.
  - Existing environments may not work after moving due to hardcoded paths in Conda’s configuration.

- **Recreating Environments** 🔄

  - If environments break after moving, recreate them:

    ```bash
    conda create --name <env_name> python=<version>
    ```
  - To avoid re-downloading packages, copy the contents of the old environment folder (e.g., `installer_files\Env\WebUI`) to the new one with the same name.

- **Package Cache** 📚

  - Packages are stored in `installer_files\conda\pkgs`, so they persist across environment recreations unless deleted.

## 🛠️ Troubleshooting

- **Download Fails**:
  - If `conda.bat` fails to download Miniconda, manually download it from the Miniconda website and place it in `installer_files\miniconda_installer.exe`.
- **Environment Not Found**:
  - Ensure you ran `env.bat` after moving the installation folder.
  - Verify the `.condarc` file in `installer_files\Miniconda` points to the correct paths.
- **Command Not Recognized**:
  - Always run commands from the prompt opened by `cmd.bat`, as it sets the necessary paths.
- **Scripts Not Working**:
  - Ensure the batch scripts are outside the `installer_files` folder.

## 🙌 Credits

- **Author**: VOIID – For creating this portable Miniconda setup and sharing it with the community. 🙏
- **Conda Team**: A huge thanks to the Conda developers and the open-source community for building an amazing tool that powers countless projects. 🌍
- **Anaconda**: For providing Miniconda and maintaining the package ecosystem. 🚀

Happy coding, and enjoy your portable Conda experience! 🎉