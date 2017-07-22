[![Build Status](https://travis-ci.org/fredrikaverpil/pyside2-wheels.svg?branch=master)](https://travis-ci.org/fredrikaverpil/pyside2-wheels) [![Build Status](https://ci.appveyor.com/api/projects/status/plmqonu08rea3s4f/branch/master?svg=true)](https://ci.appveyor.com/project/fredrikaverpil/pyside2-wheels) [ ![Download](https://api.bintray.com/packages/fredrikaverpil/pyside2-wheels/pyside2/images/download.svg) ](https://bintray.com/fredrikaverpil/pyside2-wheels/pyside2/_latestVersion#files)

# pyside2-wheels

This project aims to build PySide2 wheels on multiple platforms using Travis-CI and Appveyor.

> Note: The wheels being produced here are not "portable" or "standalone" and do require Qt5 libraries installed locally. This project could potentially implement such features by using [multibind](https://github.com/matthew-brett/multibuild) or looking at [how it can be done with PyQt5](https://github.com/pyqt/python-qt5/wiki/Updating-the-repository#bundling).

Pre-built wheels are available on [Bintray](https://bintray.com/fredrikaverpil/pyside2-wheels/pyside2/_latestVersion#files) and can be installed as long as prerequisites are in place (see Quickstart further down below).

* [pyside2-wheels/pyside2](https://bintray.com/fredrikaverpil/pyside2-wheels/pyside2#files) - wheels built from the master branch
* [pyside2-wheels/development](https://bintray.com/fredrikaverpil/pyside2-wheels/development#files) - wheels built from any non-master branch

Qt5 is supported on [these platforms](http://doc.qt.io/qt-5/supported-platforms.html).

For more information, see [this guide](https://fredrikaverpil.github.io/2016/08/17/compiling-pyside2/) on compiling PySide2.



## Table of contents

* Quickstart
  * CentOS 6, 7
  * Ubuntu 14.04, 16.04
  * Mac OS X
  * Windows
* Wheel building
  * CentOS 6, 7
  * Ubuntu 14.04, 16.04
  * Mac OS
  * Windows
* Contributing to this project
* Qt development and bug reporting



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
apt-get install qt56-meta-full
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
Set-ExecutionPolicy RemoteSigned Bypass
```

Also please note that this will install [Miniconda3](https://conda.io/miniconda.html) and create a conda environment into which PySide2 is installed.

```powershell
# Download Miniconda3
$installer_url = "https://repo.continuum.io/miniconda/Miniconda3-latest-Windows-x86_64.exe"
$installer_path = "~/Downloads/Miniconda3-latest-Windows-x86_64.exe"
(New-Object System.Net.WebClient).DownloadFile($installer_url, $installer_path)

# Install Miniconda3
cmd /C start /wait "" $installer_path /InstallationType=JustMe /RegisterPython=0 /S /D=%UserProfile%\Miniconda3

# Install conda environment in ~/condaenvs/pyside2_py35
~/Miniconda3/Scripts/conda config --add channels conda-forge
~/Miniconda3/Scripts/conda.exe create --yes --mkdir -p ~/condaenvs/pyside2_py35 python=3.5 qt=5.6

# Download and install wheel
$wheel_url = "https://dl.bintray.com/fredrikaverpil/pyside2-wheels/windows6.3.9600/PySide2-5.6-cp35-cp35m-win_amd64.whl"
~/condaenvs/pyside2_py35/Scripts/pip.exe install $wheel_url

# Test the binding
# ~/condaenvs/pyside2_py35/python.exe -c "import sys; from PySide2 import QtWidgets; app = QtWidgets.QApplication(sys.argv); button = QtWidgets.QPushButton('Hello World'); button.show(); app.exec_()"
```



## Wheel building


### CentOS 6, 7

```bash
# Build containers
docker build -f Dockerfile-centos6-qt5.6-py2.6 -t fredrikaverpil/pyside2-centos6-qt5.6-py2.6 .
docker build -f Dockerfile-centos6-qt5.6-py2.7 -t fredrikaverpil/pyside2-centos6-qt5.6-py2.7 .
docker build -f Dockerfile-centos6-qt5.6-py3.5 -t fredrikaverpil/pyside2-centos6-qt5.6-py3.5 .
docker build -f Dockerfile-centos7-qt5.6-py2.7 -t fredrikaverpil/pyside2-centos7-qt5.6-py2.7 .
docker build -f Dockerfile-centos7-qt5.6-py3.5 -t fredrikaverpil/pyside2-centos7-qt5.6-py3.5 .

# Build wheels
docker run --rm -v $(pwd):/pyside-setup/dist fredrikaverpil/pyside2-centos6-qt5.6-py2.6
docker run --rm -v $(pwd):/pyside-setup/dist fredrikaverpil/pyside2-centos6-qt5.6-py2.7
docker run --rm -v $(pwd):/pyside-setup/dist fredrikaverpil/pyside2-centos6-qt5.6-py3.5
docker run --rm -v $(pwd):/pyside-setup/dist fredrikaverpil/pyside2-centos7-qt5.6-py2.7
docker run --rm -v $(pwd):/pyside-setup/dist fredrikaverpil/pyside2-centos7-qt5.6-py3.5
```

**CentOS 6, 7 modules list as of 2017-07-19:**

```
-- module Qt5Core found ()
-- module Qt5Gui found (essential)
-- module Qt5Widgets found (essential)
-- module Qt5PrintSupport found (essential)
-- module Qt5Sql found (essential)
-- module Qt5Network found (essential)
-- module Qt5Test found (essential)
-- module Qt5Concurrent found (essential)
-- module Qt5X11Extras found (essential)
-- module Qt5Xml found ()
-- module Qt5XmlPatterns found (opt)
-- module Qt5Help found (opt)
-- module Qt5Multimedia found (opt)
-- module Qt5MultimediaWidgets found (opt)
-- module Qt5OpenGL found (opt)
-- module Qt5Qml found (opt)
-- module Qt5Quick found (opt)
-- module Qt5QuickWidgets found (opt)
-- module Qt5Script found (opt)
-- module Qt5ScriptTools found (opt)
-- module Qt5Svg found (opt)
-- module Qt5WebChannel found (opt)
-- optional module Qt5WebEngineWidgets skipped
-- module Qt5WebKit found (opt)
-- module Qt5WebKitWidgets found (opt)
-- module Qt5WebSockets found (opt)
-- Detected OS: x11
CMake Warning at CMakeLists.txt:166 (find_package):
  By not providing "FindQt5WebEngineWidgets.cmake" in CMAKE_MODULE_PATH this
  project has asked CMake to find a package configuration file provided by
  "Qt5WebEngineWidgets", but CMake did not find one.
  Could not find a package configuration file provided by
  "Qt5WebEngineWidgets" with any of the following names:
    Qt5WebEngineWidgetsConfig.cmake
    qt5webenginewidgets-config.cmake
  Add the installation prefix of "Qt5WebEngineWidgets" to CMAKE_PREFIX_PATH
  or set "Qt5WebEngineWidgets_DIR" to a directory containing one of the above
  files.  If "Qt5WebEngineWidgets" provides a separate development package or
  SDK, be sure it has been installed.
Call Stack (most recent call first):
  CMakeLists.txt:238 (COLLECT_MODULE_IF_FOUND)
-- PySide will be generated using the protected hack!
Qt5Qml_PRIVATE_INCLUDE_DIRS: /usr/include/qt5/QtNetwork/5.6.1;/usr/include/qt5/QtNetwork/5.6.1/QtNetwork;/usr/include/qt5/QtCore/5.6.1;/usr/include/qt5/QtCore/5.6.1/QtCore
-- Checking for QGtkStyle in QtWidgets -- not found
-- Checking for QMacStyle in QtWidgets -- not found
-- Checking for QSslCertificate in QtNetwork -- not found
-- Checking for QSslCipher in QtNetwork -- not found
-- Checking for QSslConfiguration in QtNetwork -- not found
-- Checking for QSslError in QtNetwork -- not found
-- Checking for QSslKey in QtNetwork -- not found
-- Checking for QSslSocket in QtNetwork -- not found
```


### Ubuntu 14.04, 16.04

```bash
# Build containers
docker build -f Dockerfile-ubuntu14.04-qt5.6-py2.7 -t fredrikaverpil/pyside2-ubuntu14.04-qt5.6-py2.7 .
docker build -f Dockerfile-ubuntu14.04-qt5.6-py3.4 -t fredrikaverpil/pyside2-ubuntu14.04-qt5.6-py3.4 .
docker build -f Dockerfile-ubuntu16.04-qt5.6-py2.7 -t fredrikaverpil/pyside2-ubuntu16.04-qt5.6-py2.7 .
docker build -f Dockerfile-ubuntu16.04-qt5.6-py3.5 -t fredrikaverpil/pyside2-ubuntu16.04-qt5.6-py3.5 .

# Build wheels
docker run --rm -v $(pwd):/pyside-setup/dist fredrikaverpil/pyside2-ubuntu14.04-qt5.6-py2.7
docker run --rm -v $(pwd):/pyside-setup/dist fredrikaverpil/pyside2-ubuntu14.04-qt5.6-py3.4
docker run --rm -v $(pwd):/pyside-setup/dist fredrikaverpil/pyside2-ubuntu16.04-qt5.6-py2.7
docker run --rm -v $(pwd):/pyside-setup/dist fredrikaverpil/pyside2-ubuntu16.04-qt5.6-py3.5
```

**Ubuntu 14.04 modules list as of 2017-07-19:**

```
-- module Qt5Core found ()
-- module Qt5Gui found (essential)
-- module Qt5Widgets found (essential)
-- module Qt5PrintSupport found (essential)
-- module Qt5Sql found (essential)
-- module Qt5Network found (essential)
-- module Qt5Test found (essential)
-- module Qt5Concurrent found (essential)
-- module Qt5X11Extras found (essential)
-- module Qt5Xml found ()
-- module Qt5XmlPatterns found (opt)
-- module Qt5Help found (opt)
-- module Qt5Multimedia found (opt)
-- module Qt5MultimediaWidgets found (opt)
-- module Qt5OpenGL found (opt)
-- module Qt5Qml found (opt)
-- module Qt5Quick found (opt)
-- module Qt5QuickWidgets found (opt)
-- module Qt5Script found (opt)
-- module Qt5ScriptTools found (opt)
-- module Qt5Svg found (opt)
-- module Qt5WebChannel found (opt)
-- module Qt5WebEngineWidgets found (opt)
CMake Warning at CMakeLists.txt:166 (find_package):
  By not providing "FindQt5WebKit.cmake" in CMAKE_MODULE_PATH this project
  has asked CMake to find a package configuration file provided by
  "Qt5WebKit", but CMake did not find one.
  Could not find a package configuration file provided by "Qt5WebKit" with
  any of the following names:
    Qt5WebKitConfig.cmake
    qt5webkit-config.cmake
  Add the installation prefix of "Qt5WebKit" to CMAKE_PREFIX_PATH or set
  "Qt5WebKit_DIR" to a directory containing one of the above files.  If
  "Qt5WebKit" provides a separate development package or SDK, be sure it has
  been installed.
Call Stack (most recent call first):
  CMakeLists.txt:239 (COLLECT_MODULE_IF_FOUND)
-- optional module Qt5WebKit skipped
CMake Warning at CMakeLists.txt:166 (find_package):
  By not providing "FindQt5WebKitWidgets.cmake" in CMAKE_MODULE_PATH this
  project has asked CMake to find a package configuration file provided by
  "Qt5WebKitWidgets", but CMake did not find one.
  Could not find a package configuration file provided by "Qt5WebKitWidgets"
  with any of the following names:
    Qt5WebKitWidgetsConfig.cmake
    qt5webkitwidgets-config.cmake
  Add the installation prefix of "Qt5WebKitWidgets" to CMAKE_PREFIX_PATH or
  set "Qt5WebKitWidgets_DIR" to a directory containing one of the above
  files.  If "Qt5WebKitWidgets" provides a separate development package or
  SDK, be sure it has been installed.
Call Stack (most recent call first):
  CMakeLists.txt:242 (COLLECT_MODULE_IF_FOUND)
-- optional module Qt5WebKitWidgets skipped
-- module Qt5WebSockets found (opt)
-- Detected OS: x11
-- PySide will be generated using the protected hack!
-- Checking for QGtkStyle in QtWidgets -- not found
-- Checking for QMacStyle in QtWidgets -- not found
-- Checking for QSslCertificate in QtNetwork -- not found
-- Checking for QSslCipher in QtNetwork -- not found
-- Checking for QSslConfiguration in QtNetwork -- not found
-- Checking for QSslError in QtNetwork -- not found
-- Checking for QSslKey in QtNetwork -- not found
-- Checking for QSslSocket in QtNetwork -- not found
```

**Ubuntu 16.04, modules list as of 2017-09-19:**

```
-- module Qt5Core found ()
-- module Qt5Gui found (essential)
-- module Qt5Widgets found (essential)
-- module Qt5PrintSupport found (essential)
-- module Qt5Sql found (essential)
-- module Qt5Network found (essential)
-- module Qt5Test found (essential)
-- module Qt5Concurrent found (essential)
-- module Qt5X11Extras found (essential)
-- module Qt5Xml found ()
-- module Qt5XmlPatterns found (opt)
-- module Qt5Help found (opt)
-- module Qt5Multimedia found (opt)
-- module Qt5MultimediaWidgets found (opt)
-- module Qt5OpenGL found (opt)
-- module Qt5Qml found (opt)
-- module Qt5Quick found (opt)
-- module Qt5QuickWidgets found (opt)
-- module Qt5Script found (opt)
-- module Qt5ScriptTools found (opt)
-- module Qt5Svg found (opt)
-- module Qt5WebChannel found (opt)
-- module Qt5WebEngineWidgets found (opt)
CMake Warning at CMakeLists.txt:166 (find_package):
  By not providing "FindQt5WebKit.cmake" in CMAKE_MODULE_PATH this project
  has asked CMake to find a package configuration file provided by
  "Qt5WebKit", but CMake did not find one.
  Could not find a package configuration file provided by "Qt5WebKit" with
  any of the following names:
    Qt5WebKitConfig.cmake
    qt5webkit-config.cmake
  Add the installation prefix of "Qt5WebKit" to CMAKE_PREFIX_PATH or set
  "Qt5WebKit_DIR" to a directory containing one of the above files.  If
  "Qt5WebKit" provides a separate development package or SDK, be sure it has
  been installed.
Call Stack (most recent call first):
  CMakeLists.txt:239 (COLLECT_MODULE_IF_FOUND)
-- optional module Qt5WebKit skipped
CMake Warning at CMakeLists.txt:166 (find_package):
  By not providing "FindQt5WebKitWidgets.cmake" in CMAKE_MODULE_PATH this
  project has asked CMake to find a package configuration file provided by
  "Qt5WebKitWidgets", but CMake did not find one.
  Could not find a package configuration file provided by "Qt5WebKitWidgets"
  with any of the following names:
    Qt5WebKitWidgetsConfig.cmake
    qt5webkitwidgets-config.cmake
  Add the installation prefix of "Qt5WebKitWidgets" to CMAKE_PREFIX_PATH or
  set "Qt5WebKitWidgets_DIR" to a directory containing one of the above
  files.  If "Qt5WebKitWidgets" provides a separate development package or
  SDK, be sure it has been installed.
Call Stack (most recent call first):
  CMakeLists.txt:242 (COLLECT_MODULE_IF_FOUND)
-- optional module Qt5WebKitWidgets skipped
-- module Qt5WebSockets found (opt)
-- Detected OS: x11
-- PySide will be generated using the protected hack!
-- Checking for QGtkStyle in QtWidgets -- not found
-- Checking for QMacStyle in QtWidgets -- not found
-- Checking for QSslCertificate in QtNetwork -- not found
-- Checking for QSslCipher in QtNetwork -- not found
-- Checking for QSslConfiguration in QtNetwork -- not found
-- Checking for QSslError in QtNetwork -- not found
-- Checking for QSslKey in QtNetwork -- not found
-- Checking for QSslSocket in QtNetwork -- not found
```

### Mac OS X 10.9.5

```bash
# Make scripts executable
chmod +x build_osx_qt5.6_py2.7.sh
chmod +x build_osx_qt5.6_py3.5.sh

# Install prerequisites and build wheels
./build_osx_qt5.6_py2.7.sh
./build_osx_qt5.6_py3.5.sh
```

**Mac OS X modules list as of 2017-09-19:**

```
-- module Qt5Core found ()
-- module Qt5Gui found (essential)
-- module Qt5Widgets found (essential)
-- module Qt5PrintSupport found (essential)
-- module Qt5Sql found (essential)
-- module Qt5Network found (essential)
-- module Qt5Test found (essential)
-- module Qt5Concurrent found (essential)
-- module Qt5MacExtras found (essential)
-- module Qt5Xml found ()
-- module Qt5XmlPatterns found (opt)
-- module Qt5Help found (opt)
-- module Qt5Multimedia found (opt)
-- module Qt5MultimediaWidgets found (opt)
-- module Qt5OpenGL found (opt)
-- module Qt5Qml found (opt)
-- module Qt5Quick found (opt)
-- module Qt5QuickWidgets found (opt)
-- module Qt5Script found (opt)
-- module Qt5ScriptTools found (opt)
-- module Qt5Svg found (opt)
-- module Qt5WebChannel found (opt)
-- module Qt5WebEngineWidgets found (opt)
CMake Warning at CMakeLists.txt:166 (find_package):
  By not providing "FindQt5WebKit.cmake" in CMAKE_MODULE_PATH this project
  has asked CMake to find a package configuration file provided by
  "Qt5WebKit", but CMake did not find one.
  Could not find a package configuration file provided by "Qt5WebKit" with
  any of the following names:
    Qt5WebKitConfig.cmake
    qt5webkit-config.cmake
  Add the installation prefix of "Qt5WebKit" to CMAKE_PREFIX_PATH or set
  "Qt5WebKit_DIR" to a directory containing one of the above files.  If
  "Qt5WebKit" provides a separate development package or SDK, be sure it has
  been installed.
Call Stack (most recent call first):
  CMakeLists.txt:239 (COLLECT_MODULE_IF_FOUND)
-- optional module Qt5WebKit skipped
CMake Warning at CMakeLists.txt:166 (find_package):
  By not providing "FindQt5WebKitWidgets.cmake" in CMAKE_MODULE_PATH this
  project has asked CMake to find a package configuration file provided by
  "Qt5WebKitWidgets", but CMake did not find one.
  Could not find a package configuration file provided by "Qt5WebKitWidgets"
  with any of the following names:
    Qt5WebKitWidgetsConfig.cmake
    qt5webkitwidgets-config.cmake
  Add the installation prefix of "Qt5WebKitWidgets" to CMAKE_PREFIX_PATH or
  set "Qt5WebKitWidgets_DIR" to a directory containing one of the above
  files.  If "Qt5WebKitWidgets" provides a separate development package or
  SDK, be sure it has been installed.
Call Stack (most recent call first):
  CMakeLists.txt:242 (COLLECT_MODULE_IF_FOUND)
-- optional module Qt5WebKitWidgets skipped
-- module Qt5WebSockets found (opt)
-- Detected OS: mac
-- !!! The generated bindings will be installed on /Users/travis/pyside-setup/pyside3_install/py3.6-qt5.6.1-64bit-release/lib/python3.6/site-packages, is it right!?
-- PySide will be generated using the protected hack!
-- Checking for QGtkStyle in QtWidgets -- not found
-- Checking for QMacStyle in QtWidgets -- not found
-- Checking for QSslCertificate in QtNetwork -- found
-- Checking for QSslCipher in QtNetwork -- found
-- Checking for QSslConfiguration in QtNetwork -- found
-- Checking for QSslError in QtNetwork -- found
-- Checking for QSslKey in QtNetwork -- found
-- Checking for QSslSocket in QtNetwork -- found
```


### Windows

Note: No wheels are generated for Python 2.7 since it is built using MSVC9 (Visual Studio 2008) and Qt5 *isn't* built with MSVC9. Mixing MSVC versions is risky as resulting errors can be very hard to solve.

Download and install:

* [Microsoft C++ Visual Studio 2015, v14.0](https://www.visualstudio.com/)
* [CMake](https://cmake.org/download) >= v3.0
* [OpenSSL](https://sourceforge.net/projects/openssl)
* Qt5 compiled with MSVC2015 from the [Qt archives](https://download.qt.io/archive/qt/)
* [Python 3.5](https://www.python.org) - which is built using MSVC2015

Please see [`appveyor.yml`](https://github.com/fredrikaverpil/pyside2-wheels/blob/master/appveyor.yml) for build commands.

**Windows 10 modules list as of 2017-07-19:**

```
-- module Qt5Core found ()
-- module Qt5Gui found (essential)
-- module Qt5Widgets found (essential)
-- module Qt5PrintSupport found (essential)
-- module Qt5Sql found (essential)
-- module Qt5Network found (essential)
-- module Qt5Test found (essential)
-- module Qt5WinExtras found (essential)
-- module Qt5Xml found ()
-- module Qt5XmlPatterns found (opt)
-- module Qt5Help found (opt)
-- module Qt5Multimedia found (opt)
-- module Qt5MultimediaWidgets found (opt)
-- module Qt5OpenGL found (opt)
-- module Qt5Qml found (opt)
-- module Qt5Quick found (opt)
-- module Qt5QuickWidgets found (opt)
-- module Qt5Script found (opt)
-- module Qt5Svg found (opt)
-- module Qt5WebChannel found (opt)
-- module Qt5WebEngineWidgets found (opt)
CMake Warning at CMakeLists.txt:166 (find_package):
  By not providing "FindQt5WebKit.cmake" in CMAKE_MODULE_PATH this project
  has asked CMake to find a package configuration file provided by
  "Qt5WebKit", but CMake did not find one.
  Could not find a package configuration file provided by "Qt5WebKit" with
  any of the following names:
    Qt5WebKitConfig.cmake
    qt5webkit-config.cmake
  Add the installation prefix of "Qt5WebKit" to CMAKE_PREFIX_PATH or set
  "Qt5WebKit_DIR" to a directory containing one of the above files.  If
  "Qt5WebKit" provides a separate development package or SDK, be sure it has
  been installed.
Call Stack (most recent call first):
  CMakeLists.txt:239 (COLLECT_MODULE_IF_FOUND)
-- optional module Qt5WebKit skipped
-- module Qt5WebSockets found (opt)
-- Detected OS: win
-- PySide2 will be generated avoiding the protected hack!
-- Checking for QGtkStyle in QtWidgets -- not found
-- Checking for QMacStyle in QtWidgets -- not found
-- Checking for QSslCertificate in QtNetwork -- found
-- Checking for QSslCipher in QtNetwork -- found
-- Checking for QSslConfiguration in QtNetwork -- found
-- Checking for QSslError in QtNetwork -- found
-- Checking for QSslKey in QtNetwork -- found
-- Checking for QSslSocket in QtNetwork -- found
```




## Contributing to this project

Fork this project and create a pull request against the `develop` branch. Wheels will be built for each commit you do, but they won't get uploaded to the Bintray [development package](https://bintray.com/fredrikaverpil/pyside2-wheels/development/_latestVersion#files) until the pull request is merged.




## Qt development and bug reporting

It's possible to follow the development and get in touch with developers. Here's a quick list of useful links for that.

* [PySide2 wiki](https://wiki.qt.io/PySide2)
* [PySide2 bug tracker](https://bugreports.qt.io/browse/PYSIDE/)
* [PySide2 git repositories](https://codereview.qt-project.org/#/admin/projects/?filter=pyside) - please note, RSS feeds are available
* [PySide2 gitter](https://gitter.im/PySide/pyside2) or #qt-pyside on irc.freenode.net (replaces the former #pyside channel, after PySide moved into Qt)
* [PySide2 mailing list](http://lists.qt-project.org/mailman/listinfo/pyside) - ([archives](http://dir.gmane.org/gmane.comp.lib.qt.pyside))
* [Qt language bindings forum](https://forum.qt.io/category/15/language-bindings)
