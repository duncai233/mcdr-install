## 介绍
此脚本旨在简化在 Windows 系统中安装 Minecraft 服务端工具 MCDReforged 的过程。脚本会自动检测和安装所需的 Python 环境（Python 3.11.9），以确保 MCDReforged 能够正常运行。

## 脚本功能
1. **自动检测 Python 环境**：
   - 脚本会检查系统中是否已安装 Python 3.8 及以上版本。
   - 如果未安装，脚本将提示用户选择是否安装 Python 3.11.9，并提供使用官方源或华为云镜像源进行下载的选项。

2. **自动安装 Python**：
   - 支持 x86、x64（AMD64）和 ARM64 架构的 CPU，自动识别系统架构并下载相应的 Python 安装包。
   - 安装完成后，Python 将被添加到系统的环境变量中，以便后续使用。

3. **自动安装或更新 MCDReforged**：
   - 如果系统中未安装 MCDReforged，脚本会询问用户是否使用中科大镜像源进行安装，以提供更快的下载速度。
   - 如果 MCDReforged 已安装，脚本将提示用户是否更新，并允许选择镜像源来加速更新过程。

## 使用方法
1. 下载 `mcdr-install.ps1`。
2. 使用 `Win + R` 打开 PowerShell，然后按 Enter。
3. 在 PowerShell 中输入 `start-process PowerShell -verb runas` 以管理员权限运行 PowerShell。
4. 使用 `cd` 命令导航到脚本所在的目录。
5. 执行 `.\mcdr-install.ps1`，如果无法执行，请运行 `set-executionpolicy remotesigned`，并输入 `Y` 确认。

## 安装步骤
- 如果检测到 Python 版本小于 3.8 或未安装，脚本将提示用户是否安装 Python 3.11.9。
- 用户可以选择使用华为云镜像源或官方源来下载并安装 Python。

- 如果未检测到 MCDReforged，脚本将提示用户是否使用中科大镜像源来加速安装。
- 脚本使用 pip 自动安装 MCDReforged，确保其依赖项也一并处理。

## 注意事项
1. **管理员权限**：为了确保 Python 和 MCDReforged 能够正确安装，建议以管理员身份运行 PowerShell。
2. **网络环境**：选择使用镜像源来加速下载可提高安装成功率和速度。
3. **自定义安装路径**：Python 将默认安装到 `C:\Python311` 目录，用户可以根据需求修改脚本中的安装路径。
