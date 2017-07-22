Write-Output "Downloading miniconda..."
$installer_url = "https://repo.continuum.io/miniconda/Miniconda3-latest-Windows-x86_64.exe"
$installer_path = "$PSScriptRoot\Miniconda3-latest-Windows-x86_64.exe"
(New-Object System.Net.WebClient).DownloadFile($installer_url, $installer_path)

Write-Output "Installing Miniconda..."
cmd /C start /wait "" $installer_path /InstallationType=JustMe /RegisterPython=0 /S /D=%UserProfile%\Miniconda3

Write-Output "Installing conda environment"
~/Miniconda3/Scripts/conda config --add channels conda-forge
~/Miniconda3/Scripts/conda.exe create --yes --mkdir -p ~/condaenvs/pyside2_py35 python=3.5 qt=5.6

Write-Output "Downloading PySide2 wheel..."
$wheel_url = "https://dl.bintray.com/fredrikaverpil/pyside2-wheels/windows6.3.9600/PySide2-5.6-cp35-cp35m-win_amd64.whl"

Write-Output "Installing PySide2 wheel..."
~/condaenvs/pyside2_py35/Scripts/pip.exe install $wheel_url

# Test the binding
# ~/condaenvs/pyside2_py35/python.exe -c "import sys; from PySide2 import QtWidgets; app = QtWidgets.QApplication(sys.argv); button = QtWidgets.QPushButton('Hello World'); button.show(); app.exec_()"
