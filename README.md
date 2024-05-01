# FileForge 🛠️

FileForge is a command-line tool designed to simplify and expedite the process of creating directory and file structures for software development projects. With this program, developers can easily generate folder and file structures for a variety of project types, including those that follow specific patterns such as Model-View-Controller (MVC) architecture or Python projects. Offering broad support and clear visual feedback, FileForge is a convenient solution for quickly setting up the foundation of a project, allowing developers to focus more on software development and less on the initial organization of the project.

## Summary

- [Installation](#installation)
- [How to Use](#how-to-use)
- [Types of Structures](#types-of-structures)
- [Features](#features)
- [Troubleshooting](#troubleshooting)
- [Contribute and Report Issues](#contribute-and-report-issues)
- [For More Information](#for-more-information)

## Installation

🚀

### 1. Download the [download.zip](https://github.com/Gustavo2022003/FileForge/archive/refs/heads/FF-main.zip) file or clone this repository to your computer.

**GitHub CLI:**

```
gh repo clone Gustavo2022003/FileForge
```

**HTTPS:**
```
git clone https://github.com/Gustavo2022003/FileForge.git
```

**SSH:**
```
git@github.com:Gustavo2022003/FileForge.git
```

### 2. Make sure you have PowerShell installed on your system:

To check if PowerShell is installed on your Windows system, you can follow these steps:

1. **Open PowerShell**: Press `Win + R` keys to open the "Run" dialog, type "powershell", and press Enter. If PowerShell is installed, a PowerShell window will open.

2. **Check the version**: In PowerShell, you can type the following command and press Enter:
   ```
   $PSVersionTable.PSVersion
   ```
   This will display information about the version of PowerShell installed on your system.

3. **Check for the presence of the executable**: You can also check if the PowerShell executable is present on your system. The default path to the PowerShell executable is `C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe`. You can navigate to this directory in File Explorer and check if the `powershell.exe` file is present.

If PowerShell is installed, you should be able to see its version and start the PowerShell environment without any issues. If it is not installed, you can install the latest version directly from the Microsoft website or through the Windows Store, depending on your version of Windows.

### 3. Navigate to the directory where you downloaded/cloned the repository.


### 4. Run the `FF.ps1` script using PowerShell.

---

To improve the "How to Use" section, we can add more details about each of the available options and provide clearer usage examples. Here's an enhanced version:

## How to Use

📝 To use the project, execute the `FF.ps1` script in PowerShell with the following parameters:

```
.\FF.ps1 <target_directory> <project_name> [-puv] [-mvc] [-py] [-help]
```

You can also specify the options as a string delimited by quotes:

```
.\FF.ps1 <target_directory> <project_name> ["-puv"] ["-mvc"] ["-py"] ["-help"]
```

<img src="public/src/simple/GIF_flagAsString.gif">

### Options

⚙️ Here are the available options:

| Option  | Description                                                                                                           |
|--------|-----------------------------------------------------------------------------------------------------------------------|
| `-puv` | Creates the directory and file structure for a project with public, utils, and views directory structure.             |
| `-mvc` | Creates the directory and file structure for a project following the Model-View-Controller (MVC) architecture pattern. |
| `-py`  | Creates the directory and file structure for a Python project.                                                         |
| `-help`| Displays the help message with information on how to use the script.                                                    |

Make sure to choose the appropriate option for the type of project you are starting. For example:

```
.\FF.ps1 C:\Projects\MyProject my_project -mvc
```

This command will create the directory and file structure for an MVC project named "my_project" in the directory "C:\Projects\MyProject".

## Types of Structures

FileForge supports different types of directory and file structures, including:

- **PUV**: Structure with directories: public, utils, and views.
- **MVC**: Structure following the Model-View-Controller (MVC) architecture pattern.
- **Python**: Structure for Python projects.

Of course, here's an enhanced version of the "Features" section:

## Features

✨ FileForge offers several features that make the creation of directory and file structures more efficient and intuitive:

- **Fast and Easy**: Facilitates quick and easy creation of directory and file structures for a wide variety of project types, significantly reducing the time spent on initial project setup.

- **Broad Support**: Provides comprehensive

 support for various types of projects, including those with public, utils, and views directory structure, following the Model-View-Controller (MVC) architecture pattern, and Python projects, allowing flexible adaptation to the specific needs of each project.

- **Visual Feedback**: Provides colorful feedback messages during the structure creation process, making it easier and faster to identify success or failure in creation, allowing for a more intuitive and informative user experience.

These combined characteristics make FileForge a powerful and convenient tool for developers, allowing them to focus more on software development and less on the initial organization of the project.

## Troubleshooting

🛟 If you encounter issues while using FileForge, check the following:

- **PowerShell**: Make sure PowerShell is installed and configured correctly on your system.
- **Permissions**: Verify that you have sufficient permissions to create directories and files in the target directory.
- **Issues**: If you encounter specific errors, refer to the [Issues](https://github.com/Gustavo2022003/FileForge/issues) section or open a new Issue to report the problem.

## Possible Errors and Solutions

During the use of FileForge, you may encounter some common errors. Here are some of the most frequent issues and their corresponding solutions:

### 1. Permission Denied Error When Creating Directory or File

**⚠️ Issue**: You receive an error message indicating that you do not have permission to create a directory or file in the target directory.

**✅ Solution**: Check your user permissions on the operating system. Ensure you have write permissions in the target directory. If running the script in a security-controlled environment, contact the system administrator for assistance.

### 2. Duplicate Project Name

**⚠️ Issue**: You attempt to create a project with a name that already exists in the target directory.

**✅ Solution**: Choose a different name for the project or delete the existing project before attempting to create a new one with the same name. Make sure to check the target directory before creating a new project to avoid name conflicts.

### 3. Error When Running the Script

**⚠️ Issue**: You receive an error when trying to execute the `FF.ps1` script.

**✅ Solution**: Ensure PowerShell is installed correctly on your system and that you are using the correct command to run the script. Also, make sure you are in the correct directory where the script is located. If the issue persists, check for syntax errors in the script or missing dependencies.

### 4. Error When Moving Files

**⚠️ Issue**: The script fails to move some files to their final destinations.

**✅ Solution**: Verify that the target directories are correctly created and that the script has permission to access them. Ensure that file and directory names are correct and that there are no naming conflicts. If necessary, check the write and access permissions on the file system.

### 5. Environment Configuration Issues

**⚠️ Issue**: The script does not function as expected due to incorrect environment settings.

**✅ Solution**: Ensure all necessary environment settings are correctly configured. This may include environment variables, PowerShell settings, user permissions, and other factors that may affect the script's execution. Refer to the FileForge and PowerShell documentation for more information on the required environment settings.

### 6. Duplicate Parameter (flag 🚩)

**⚠️ Issue**: Duplicate parameter is being selected in the script execution

**✅ Solution**: Make sure to select only one of the option parameters. You can find these parameters in the [Options ⚙️](#options) section.

### 7. Nonexistent Parameter (flag 🚩)

**⚠️ Issue**: Nonexistent parameter is being assigned to a script argument

**✅ Solution**: Make sure to select only one of the option parameters. You can find these parameters in the [Options ⚙️](#options) section.

### 8. Undefined Parameter (flag 🚩)

**⚠️ Issue**: No option parameter (flag 🚩) is selected for the project creation

**✅ Solution**: Make sure to select only one of the option parameters. You can find these parameters in the [Options ⚙️](#options) section.

### 9. Undefined Target Directory

**⚠️ Issue**: No directory is assigned to the second parameter

**✅ Solution**: Make sure to specify the name of the directory where the project will be created: You can find the program structure in the [How to Use 📝](#how-to-use) section

### 10. Undefined Project Name

**⚠️ Issue**: The project name is not assigned to the third parameter

**✅ Solution**: Make sure to specify the name of the project: You can find the program structure in the [How to Use 📝](#how-to-use) section

If you encounter other errors or issues while using FileForge, feel free to report the problem by opening a new Issue on the [project repository](https://github.com/Gustavo2022003/FileForge/issues). We are here to help and resolve any issues you may encounter while using the tool.

## Contribute and Report Issues

🤝 If you have questions, suggestions for improvements, or encounter bugs, feel free to open a new Issue on the [project repository](https://github.com/Gustavo2022003/FileForge/issues). We are always open to feedback and contributions ❤️

## For More Information

Visit the [project repository](https://github.com/Gustavo2022003/FileForge) for more details and updates.
