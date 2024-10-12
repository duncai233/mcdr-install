$Host.UI.RawUI.WindowTitle = "mcdr-install by:duncai233"
Write-Host "by:duncai233 github.com/duncai233/mcdr-install"
function python_install {
    $python_install = Read-Host '是否安装Python 3.11.9 (y/n)'
    if ($python_install -eq 'y') { 
        Write-Host '官方下载过慢可尝试镜像'
        $mirror= Read-Host '是否使用华为Python源(y/n)'
        if ($mirror-eq 'y') {
            Write-Host '使用华为Python源'
           $cpuArchitecture = $Env:PROCESSOR_ARCHITECTURE
           if ($cpuArchitecture -eq 'AMD64') {
               Write-Host '当前 CPU 架构是 64 位 (AMD64)'
               Invoke-WebRequest -Uri https://mirrors.huaweicloud.com//python/3.11.9/python-3.11.9-amd64.exe  -OutFile C:\Python_setup.exe
               Write-Host '下载完毕，安装中'
               Write-Host '稍安勿躁'
               cmd /c C:\Python_setup.exe /quiet TargetDir=C:\Python311 InstallAllUsers=1 PrependPath=1 Include_test=0
               Write-Host 'Python装完毕' 
            }
            elseif ($cpuArchitecture -eq 'ARM64') {
               Write-Host '当前 CPU 架构是 ARM 64 位'
               Invoke-WebRequest -Uri https://mirrors.huaweicloud.com//python/3.11.9/python-3.11.9-arm64.exe  -OutFile C:\Python_setup.exe
               Write-Host '下载完毕，安装中'
               Write-Host '稍安勿躁'
               cmd /c C:\Python_setup.exe /quiet TargetDir=C:\Python311 InstallAllUsers=1 PrependPath=1 Include_test=0
               Write-Host 'Python装完毕' 
            }
            elseif ($cpuArchitecture -eq 'x86') {
               Write-Host '当前 CPU 架构是 32 位 (x86)'
               Invoke-WebRequest -Uri https://mirrors.huaweicloud.com//python/3.11.9/python-3.11.9.exe  -OutFile C:\Python_setup.exe
               Write-Host '下载完毕，安装中'
               Write-Host '稍安勿躁'
               cmd /c C:\Python_setup.exe /quiet TargetDir=C:\Python311 InstallAllUsers=1 PrependPath=1 Include_test=0
               Write-Host 'Python装完毕' 
            }
            elseif ($cpuArchitecture -eq 'ARM') {
               Write-Host '当前 CPU 架构是 arm 32 位'
               Write-Host '华为并未提供安装包'
               Write-Host '请自行安装Python'
               exit
            }
            else {
               Write-Host "'未知的 CPU 架构:' $cpuArchitecture '无法下载'"
               exit
           }
        }
        elseif ($mirror-eq 'n') {
    
           Write-Host '使用官方Python源'
           $cpuArchitecture = $Env:PROCESSOR_ARCHITECTURE
           if ($cpuArchitecture -eq 'AMD64') {
               Write-Host '当前 CPU 架构是 64 位 (AMD64)'
               Invoke-WebRequest -Uri https://www.python.org/ftp/python/3.11.9/python-3.11.9-amd64.exe  -OutFile C:\Python_setup.exe
               Write-Host '下载完毕，安装中'
               Write-Host '稍安勿躁'
               cmd /c C:\Python_setup.exe /quiet TargetDir=C:\Python311 InstallAllUsers=1 PrependPath=1 Include_test=0
               Write-Host 'Python装完毕' 
            }
            elseif ($cpuArchitecture -eq 'ARM64') {
               Write-Host '当前 CPU 架构是 ARM 64 位'
               Invoke-WebRequest -Uri https://www.python.org/ftp/python/3.11.9/python-3.11.9-arm64.exe  -OutFile C:\Python_setup.exe
               Write-Host '下载完毕，安装中'
               Write-Host '稍安勿躁'
               cmd /c C:\Python_setup.exe /quiet TargetDir=C:\Python311 InstallAllUsers=1 PrependPath=1 Include_test=0
               Write-Host 'Python装完毕' 
            }
            elseif ($cpuArchitecture -eq 'x86') {
               Write-Host '当前 CPU 架构是 32 位 (x86)'
               Invoke-WebRequest -Uri https://www.python.org/ftp/python/3.11.9/python-3.11.9.exe  -OutFile C:\Python_setup.exe
               Write-Host '下载完毕，安装中'
               Write-Host '稍安勿躁'
               cmd /c C:\Python_setup.exe /quiet TargetDir=C:\Python311 InstallAllUsers=1 PrependPath=1 Include_test=0
               Write-Host 'Python装完毕' 
            }
            elseif ($cpuArchitecture -eq 'ARM') {
               Write-Host '当前 CPU 架构是arm 32 位'
               Write-Host 'Python官方并未提供安装包'
               Write-Host '请自行安装'
               exit
            }
            else {
               Write-Host "'未知的 CPU 架构:' $cpuArchitecture '无法下载'"
               exit
           }
        }
        else {
            Write-Host '无效输入,请输入 y 或 n'
            exit
        }

    }
    elseif ($python_install -eq 'n') {
        Write-Host '不安装Python 请自行安装Python >=3.8'
        exit
    }
    else {
        Write-Host '无效输入,请输入 y 或 n'
        exit
    }
}
Write-Host '检查Python版本是否符合要求(>=3.8)'
$pythonVersion = (Get-Command python -ErrorAction SilentlyContinue)
if ($pythonVersion) {
    $versionOutput = python --version 2>&1
    $version = $versionOutput -replace "Python ", "" 
    $versionNumbers = $version -split '\.' 
    if ([int]$versionNumbers[0] -gt 3 -or ([int]$versionNumbers[0] -eq 3 -and [int]$versionNumbers[1] -ge 8)) {
        Write-Host "'Python 版本是 '$version,大于或等于 3.8 符合要求'"
    } else {
        Write-Host "'Python 版本是' $version',小于 3.8 不符合要求'"
        python_install
    }
}
else {
    Write-Host 'Python 未安装或未添加到 PATH'
    python_install
}
if (!(Get-Command mcdreforged -ErrorAction SilentlyContinue)) {
    Write-Host '未安装mcdreforged'
    Write-Host '官方安装过慢可尝试镜像源'
    $useUSTCMirror = Read-Host '是否使用中科大镜像源(y/n)'
    if ($useUSTCMirror -eq 'y') {
        $mirror = "-i https://pypi.mirrors.ustc.edu.cn/simple"
        Write-Host '使用中科大源进行安装'
    }
    elseif ($useUSTCMirror -eq 'n') {
        $mirror = ""
        Write-Host '使用官方源进行安装'
    }
    else {
        Write-Host '无效输入,请输入 y 或 n'
        exit
    }
Write-Host '开始安装 mcdreforged'
pip install mcdreforged $mirror
$env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine")
Write-Host 'mcdreforged 已安装'
}
else {
    Write-Host 'mcdreforged 已安装'
    Write-Host '尝试更新mcdreforged'
    Write-Host '官方更新过慢可尝试镜像源'
    $useUSTCMirror = Read-Host '是否使用中科大镜像源(y/n)'
    if ($useUSTCMirror -eq 'y') {
        $mirror = "-i https://pypi.mirrors.ustc.edu.cn/simple"
        Write-Host '使用中科大源进行更新'
    }
    if ($useUSTCMirror -eq 'n') {
        $mirror = ""
        Write-Host '使用官方源进行更新'
    }
    else {
        Write-Host '无效输入,请输入 y 或 n'
        exit
    }
    pip install mcdreforged -U $mirror
}
# $initialize = Read-Host '是否在当前目录初始化mcdreforged? (y/n)'
# if ($initialize -eq 'y') {
#     Write-Host '开始初始化'
#     mcdreforged init
#     Write-Host '初始化完成'
# }
# if ($initialize -eq 'n') {
#     Write-Host '不进行初始化'
# }
# else {
#     Write-Host '无效输入,请输入 y 或 n'
#     exit
# }
# Write-Host '安装完成'
# exit