## Quickstart


### Centos 6

```bash
# Prerequisites
yum install epel-release centos-release-SCL
yum install --skip-broken qt5*

# Python 2.6 (possibly already installed)
yum install python-pip
pip install https://dl.bintray.com/fredrikaverpil/pyside2-wheels/centos6/PySide2-5.6-cp26-cp26mu-linux_x86_64.whl

# Python 2.7
yum install python27 python27-python-pip
export LD_LIBRARY_PATH=/opt/rh/python27/root/usr/lib64/
/opt/rh/python27/root/usr/bin/pip install https://dl.bintray.com/fredrikaverpil/pyside2-wheels/centos6/PySide2-5.6-cp27-cp27mu-linux_x86_64.whl
```

### Centos 7

```bash
# Prerequisites
yum install --skip-broken qt5*

# Python 3.5
yum install https://centos7.iuscommunity.org/ius-release.rpm
yum install python35u python35u-pip
pip3.5 install https://dl.bintray.com/fredrikaverpil/pyside2-wheels/centos7/PySide2-5.6-cp35-cp35m-linux_x86_64.whl

# Python 2.7 (possibly already installed)
yum install epel-release
yum install python-pip
pip install https://dl.bintray.com/fredrikaverpil/pyside2-wheels/centos7/PySide2-5.6-cp27-cp27mu-linux_x86_64.whl
```


### Ubuntu 14.04 Trusty

```bash
# Prerequisites
apt-get update
apt-get install software-properties-common
add-apt-repository ppa:beineri/opt-qt562-trusty
apt-get update
apt-get install qt56-meta-full
echo . /opt/qt56/bin/qt56-env.sh >> ~/.bashrc
. ~/.bashrc

# Python 3.4 (possibly already installed)
apt-get install python3-pip
pip3 install https://dl.bintray.com/fredrikaverpil/pyside2-wheels/ubuntu14.04/PySide2-5.6-cp34-cp34m-linux_x86_64.whl

# Python 2.7
apt-get install python-pip
pip install https://dl.bintray.com/fredrikaverpil/pyside2-wheels/ubuntu14.04/PySide2-5.6-cp27-none-linux_x86_64.whl
```


### Ubuntu 16.04 Xenial

```bash
# Prerequisites
apt-get update
apt-get install software-properties-common
add-apt-repository ppa:beineri/opt-qt562-xenial
apt-get update
apt-get install qt56-meta-full qt56creator
echo . /opt/qt56/bin/qt56-env.sh >> ~/.bashrc
. ~/.bashrc

# Python 3.5 (possibly already installed)
apt-get install python3-pip
pip3 install https://dl.bintray.com/fredrikaverpil/pyside2-wheels/ubuntu16.04/PySide2-5.6-cp35-cp35m-linux_x86_64.whl

# Python 2.7
apt-get install python-pip
pip install https://dl.bintray.com/fredrikaverpil/pyside2-wheels/ubuntu16.04/PySide2-5.6-cp27-cp27mu-linux_x86_64.whl
```

### macOS

To be documented.


### Windows

Run the following commands in an administrative Powershell console.

Note: you may have to [change your execution policy](https://technet.microsoft.com/en-us/library/ee176961.aspx) prior to installing. Example:

```powershell
Set-ExecutionPolicy Bypass
```

Also please note that this will install [Miniconda3](https://conda.io/miniconda.html) and create a conda environment into which PySide2 is installed. Currently, the wheels are not produced from a conda-built Python environment. If issues arise because of this, please open a new issue.

```powershell
# Download Miniconda3
$installer_url = "https://repo.continuum.io/miniconda/Miniconda3-latest-Windows-x86_64.exe"
$installer_path = "~/Downloads/Miniconda3-latest-Windows-x86_64.exe"
(New-Object System.Net.WebClient).DownloadFile($installer_url, $installer_path)

# Install Miniconda3
cmd /C start /wait "" $installer_path /InstallationType=JustMe /RegisterPython=0 /S /D=%UserProfile%\Miniconda3

# Python 3.5 virtual conda environment in ~/condaenvs/pyside2_py35
~/Miniconda3/Scripts/conda config --add channels conda-forge
~/Miniconda3/Scripts/conda.exe create --yes --mkdir -p ~/condaenvs/pyside2_py35 python=3.5 qt=5.6
$wheel_url = "https://dl.bintray.com/fredrikaverpil/pyside2-wheels/windows6.3.9600/PySide2-5.6-cp35-cp35m-win_amd64.whl"
~/condaenvs/pyside2_py35/Scripts/pip.exe install $wheel_url

# Test the binding
# ~/condaenvs/pyside2_py35/python.exe -c "import sys; from PySide2 import QtWidgets; app = QtWidgets.QApplication(sys.argv); button = QtWidgets.QPushButton('Hello World'); button.show(); app.exec_()"
```
