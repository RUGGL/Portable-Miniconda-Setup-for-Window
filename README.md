# 🚀 Portable Miniconda Setup for Windows 🪟

This project provides a set of Windows batch scripts to create a portable, self-contained Miniconda environment that you can use anywhere.

---

## 🧪 Example: Multiple Environments with Different CUDA Versions

Demonstrating two separate Conda environments (`OpenUI` and `AiBot`) each using its own CUDA toolkit:

```powershell
(C:\Users\SHIDO\Project\installer_files\Environments\OpenUI) ()> nvcc --version
nvcc: NVIDIA (R) Cuda compiler driver
Copyright (c) 2005-2023 NVIDIA Corporation
Built on Wed_Feb__8_05:53:42_Coordinated_Universal_Time_2023
Cuda compilation tools, release 12.1, V12.1.66
Build cuda_12.1.r12.1/compiler.32415258_0

(C:\Users\SHIDO\Project\installer_files\Environments\AiBot) ()> nvcc --version
nvcc: NVIDIA (R) Cuda compiler driver
Copyright (c) 2005-2024 NVIDIA Corporation
Built on Tue_Feb_27_16:28:36_Pacific_Standard_Time_2024
Cuda compilation tools, release 12.4, V12.4.99
Build cuda_12.4.r12.4/compiler.33961263_0
```

> **Note:** These environments are completely portable. You can relocate the entire `installer_files` folder anywhere, then run `SetEnv.bat` to update paths and retain functionality.

---

### Movable Components

The following directories are entirely relocatable, provided you execute `SetEnv.bat` after moving:

* **Miniconda** installation root
* **Environments** (all Conda environments)
* **Conda** (Miniconda package cache)

When you use conda or activate an environment, Conda resolves packages from `installer_files\Conda\pkgs` and Avoids `\installer_files\Miniconda\pkgs`  

> **Tip:** Always work inside a named environment to keep packages isolated and avoid polluting the global cache.

---

### Cache Growth Warning

If you install different CUDA versions or similar large toolkits across multiple environments, the `installer_files\Conda\pkgs` folder will grow substantially. **Recommendation:** Choose a single, stable CUDA toolkit (or toolkit version) that meets your project requirements and is widely supported by your dependencies.

---

```markdown
## Note on Conda Package Installation

When installing packages like CUDA and cuDNN using a command such as:

```bash
conda install -c nvidia/label/cuda-12.1.0 cuda cudnn
```

Conda checks if the required packages already exist in the Conda package cache (`conda/pkgs`). If they do, Conda will link the pre-existing packages to the target environment (e.g., `C:\Users\CSP\Downloads\installer_files\Environments\openwebui`) without re-downloading or reinstalling them. 

For example, if one environment has already installed CUDA 11.7, and another environment requires the same version, Conda will reuse the cached CUDA 11.7 package and link it to the new environment. Conda only downloads and installs packages when they are not already present in the cache and are required by the environment.

## 📖 Table of Contents

* Features
* Prerequisites
* Scripts Overview
* Installation Guide
* Usage Instructions
* Why Use Conda?
* Technical Details
* Portability Notes
* Troubleshooting
* Credits

## ✨ Features

* 🛠️ **Portable**: Run Miniconda from any directory without system-wide installation.
* ⚙️ **Automated Setup**: Scripts handle downloading, installing, and configuring Miniconda.
* 📂 **Organized Structure**: Environments and packages are neatly stored in dedicated folders.
* 🔄 **Relocatable**: Move the installation folder and reconfigure paths with ease.
* 🐍 **Flexible Python Versions**: Create environments with your choice of Python versions and packages (e.g., CUDA support).
* 🚀 **User-Friendly**: Pre-configured `Cmd.bat` for seamless Conda management.

## 🛠️ Prerequisites

* Windows operating system (64-bit).
* Internet connection (for downloading Miniconda during setup).
* **Important**: Do **not** place or move the batch scripts inside the `installer_files` folder after running them.

## 📜 Scripts Overview

This repository includes three batch scripts for Windows:

1. **GetConda.bat** 🛠️

   * Downloads and installs Miniconda to `installer_files\Miniconda`.
   * Creates folders: `installer_files`, `installer_files\Conda`, `installer_files\Environments`.
   * Deletes the installer after setup to save space.
   * Configures a portable `.condarc` file for environment and package paths.

2. **SetEnv.bat** ⚙️

   * Updates the `.condarc` file in `installer_files\Miniconda` with the current directory's environment and package paths.
   * Run this script if you move the installation folder to a new location.

3. **Cmd.bat** 💻

   * Opens a command prompt with pre-configured paths for Conda.
   * Displays helpful commands for creating and activating environments.
   * Simplifies Conda management without manual path configuration.

## 📦 Installation Guide

Follow these steps to set up your portable Miniconda environment:

1. **Clone or Download the Repository** 📥

   * Clone this repository or download the ZIP file and extract it to your desired location.
   * Example: `C:\Users\YourName\PortableConda`.

2. **Run** `Conda.bat` 🚀

   * Double-click `conda.bat` or run it from a command prompt.
   * This script:

     * Creates the `installer_files` directory.
     * Downloads Miniconda (Python 3.10.13 by default).
     * Installs it to `installer_files\Miniconda`.
     * Sets up the `installer_files\Environments` folder for environments.
     * Sets up the `\installer_files\Conda\pkgs` folder for Conda Pkgs.
     * Configures the `.condarc` file.

3. **Run** `SetEnv.bat` ⚙️

   * After `GetConda.bat` completes, run `SetEnv.bat`.
   * This updates the `.condarc` file with the correct paths for environments (`installer_files\Environments`) and packages (`installer_files\Conda\pkgs`).

4. **Use** `cmd.bat` 💻

   * Run `Cmd.bat` to open a command prompt with Conda paths pre-configured.

**Note**: Keep the batch scripts outside the `installer_files` folder at all times to avoid issues.

## 🖥️ Usage Instructions

Once installed, you can manage Conda environments using `Cmd.bat`. Here’s how:

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

### Deactivating an Environment ⏹️

Return to the base environment.

```bash
conda deactivate
```

## 🌟 Why Use Conda?

Conda is a powerful package and environment manager that simplifies dependency management for Python and other languages. Here’s why it’s awesome:

* **Cross-Platform**: Works on Windows, macOS, and Linux.
* **Isolated Environments**: Create separate environments for different projects to avoid package conflicts.
* **Non-Python Support**: Install non-Python packages like R, CUDA, or compilers.
* **Flexible Channels**: Access packages from channels like `conda-forge` or `nvidia`.
* **Portable**: This setup makes Conda fully portable, ideal for USB drives or shared systems.

Conda is perfect for:

* Data science (e.g., NumPy, Pandas, Jupyter).
* Machine learning (e.g., TensorFlow, PyTorch, CUDA).
* Scientific computing (e.g., SciPy, Matplotlib).
* Development with multiple Python versions.

## 🔍 Technical Details

* **Miniconda Version**: The scripts download Miniconda3-py310\_23.11.0-2 for Windows (64-bit), which includes Python 3.10.13 by default.
* **Folder Structure**:

  * `installer_files\Miniconda`: Miniconda installation.
  * `installer_files\Environments`: Conda environments.
  * `installer_files\Conda\pkgs`: Package cache.
* **Download Methods**: `GetConda.bat` tries CURL to ensure reliable downloads.
* **Configuration**: The `.condarc` file is customized to store environments and packages locally, making the setup portable.
* **Path Management**: `Cmd.bat` temporarily sets paths for the session, avoiding system-wide changes.

## 📍 Portability Notes

This setup is designed to be portable, but there are a few things to keep in mind:

* **Moving the Installation** 📦

  * If you move the installation folder (e.g., to a USB drive), run `Environments.bat` to update the `.condarc` file with the new paths.

* **Package Cache** 📚

  * Packages are stored in `installer_files\Conda\pkgs`, so they persist across environment recreations unless deleted.

## 🛠️ Troubleshooting

* **Download Fails**:

  * If `GetConda.bat` fails to download Miniconda, manually download it from the Miniconda website and place it in `installer_files\miniconda_installer.exe`.
* **Environment Not Found**:

  * Ensure you ran `SetEnv.bat` after moving the installation folder.
  * Verify the `.condarc` file in `installer_files\Miniconda` points to the correct paths.
* **Command Not Recognized**:

  * Always run commands from the prompt opened by `Cmd.bat`, as it sets the necessary paths.
* **Scripts Not Working**:

  * Ensure the batch scripts are outside the `installer_files` folder.

## 🙌 Credits

* **Author**: VOIID – For creating this portable Miniconda setup and sharing it with the community. 🙏
* **Conda Team**: A huge thanks to the Conda developers and the open-source community for building an amazing tool that powers countless projects. 🌍
* **Anaconda**: For providing Miniconda and maintaining the package ecosystem. 🚀

Happy coding, and enjoy your portable Conda experience! 🎉
