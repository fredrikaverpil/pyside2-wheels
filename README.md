[![Build Status](https://travis-ci.org/fredrikaverpil/pyside2-wheels.svg?branch=master)](https://travis-ci.org/fredrikaverpil/pyside2-wheels) [![Build Status](https://ci.appveyor.com/api/projects/status/plmqonu08rea3s4f/branch/master?svg=true)](https://ci.appveyor.com/project/fredrikaverpil/pyside2-wheels) [ ![Download](https://api.bintray.com/packages/fredrikaverpil/pyside2-wheels/pyside2/images/download.svg) ](https://bintray.com/fredrikaverpil/pyside2-wheels/pyside2/_latestVersion#files)

# pyside2-wheels

> Note: The wheels being produced are not "portable" or "standalone" and do require Qt5 libraries installed locally. This project could potentially implement such features by using [multibind](https://github.com/matthew-brett/multibuild) or looking at [how it can be done with PyQt5](https://github.com/pyqt/python-qt5/wiki/Updating-the-repository#bundling).

For more information, see [this guide](https://fredrikaverpil.github.io/2016/08/17/compiling-pyside2/) on compiling PySide2.

<br><br>

### Quickstart

Pre-built wheels for Python 2.7 and 3.4 on each platform are available on [Bintray](https://bintray.com/fredrikaverpil/pyside2-wheels/pyside2/_latestVersion#files).

**Ubuntu 14.04, Python 2.7**

```bash
# Prerequisities
$ apt-get install wget python-pip python-dev software-properties-common
$ add-apt-repository ppa:beineri/opt-qt561-trusty
$ apt-get update
$ apt-get install qt56base
$ echo . /opt/qt56/bin/qt56-env.sh >> ~/.bashrc
$ . ~/.bashrc

# Install
$ wget https://bintray.com/fredrikaverpil/pyside2-wheels/download_file?file_path=ubuntu14.04%2FPySide2-2.0.0.dev0-cp27-none-linux_x86_64.whl -O PySide2-2.0.0.dev0-cp27-none-linux_x86_64.whl
$ pip install PySide2-2.0.0.dev0-cp27-none-linux_x86_64.whl

# Test
$ python
>>> import sys
>>> from PySide2 import QtWidgets
>>> app = QtWidgets.QApplication(sys.argv)
>>> button = QtWidgets.QPushButton("Hello")
>>> button.setFixedSize(400, 400)
>>> button.show()
>>> app.exec_()
```

<br><br>

## Wheel building

Wheels are created by Travis CI (Linux, OS X) and AppVeyor (Windows). They are then uploaded to Bintray:

* [pyside2-wheels/pyside2](https://bintray.com/fredrikaverpil/pyside2-wheels/pyside2#files) - wheels built from the master branch
* [pyside2-wheels/development](https://bintray.com/fredrikaverpil/pyside2-wheels/development#files) - wheels built from any non-master branch

Qt5 is supported on [these platforms](http://doc.qt.io/qt-5/supported-platforms.html).

### Ubuntu 14.04, 16.04

Note: Not all modules are found during PySide2 wheel building: [PYSIDE-343](https://bugreports.qt.io/browse/PYSIDE-343)

```bash
# Build containers
docker build -f Dockerfile-ubuntu14.04-py2.7 -t fredrikaverpil/pyside2-ubuntu14.04-py2.7 .
docker build -f Dockerfile-ubuntu14.04-py3.5 -t fredrikaverpil/pyside2-ubuntu14.04-py3.5 .
docker build -f Dockerfile-ubuntu16.04-py2.7 -t fredrikaverpil/pyside2-ubuntu16.04-py2.7 .
docker build -f Dockerfile-ubuntu16.04-py3.5 -t fredrikaverpil/pyside2-ubuntu16.04-py3.5 .

# Build wheels
docker run --rm -v $(pwd):/pyside-setup/dist fredrikaverpil/pyside2-ubuntu14.04-py2.7
docker run --rm -v $(pwd):/pyside-setup/dist fredrikaverpil/pyside2-ubuntu14.04-py3.5
docker run --rm -v $(pwd):/pyside-setup/dist fredrikaverpil/pyside2-ubuntu16.04-py2.7
docker run --rm -v $(pwd):/pyside-setup/dist fredrikaverpil/pyside2-ubuntu16.04-py3.5
```

### CentOS 6, 7

Note: [A hack](https://github.com/fredrikaverpil/pyside2-wheels/blob/dcac29afa995a571e72efc5a2c0e919c76b5691c/Dockerfile-centos7-py3.5#L15-L35) was implemented to work around this issue: [PYSIDE-342](https://bugreports.qt.io/browse/PYSIDE-342)

```bash
# Build containers
docker build -f Dockerfile-centos6-py2.7 -t fredrikaverpil/pyside2-centos6-py2.7 .
docker build -f Dockerfile-centos6-py3.5 -t fredrikaverpil/pyside2-centos6-py3.5 .
docker build -f Dockerfile-centos7-py2.7 -t fredrikaverpil/pyside2-centos7-py2.7 .
docker build -f Dockerfile-centos7-py3.5 -t fredrikaverpil/pyside2-centos7-py3.5 .

# Build wheels
docker run --rm -v $(pwd):/pyside-setup/dist fredrikaverpil/pyside2-centos6-py2.7
docker run --rm -v $(pwd):/pyside-setup/dist fredrikaverpil/pyside2-centos6-py3.5
docker run --rm -v $(pwd):/pyside-setup/dist fredrikaverpil/pyside2-centos7-py2.7
docker run --rm -v $(pwd):/pyside-setup/dist fredrikaverpil/pyside2-centos7-py3.5
```

### Mac OS X 10.9.5

```bash
# Make scripts executable
chmod +x build_osx_py2.7.sh
chmod +x build_osx_py3.5.sh

# Install prerequisites and build wheels
./build_osx_py2.7.sh
./build_osx_py3.5.sh
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

<br><br>

## Installing and using the wheels

### OS X

You need Python and Qt5 installed just like in the build environments. Please see `build_osx_pyX.X.sh` for details on OS X. This example is for Python 3.5:

1. Download a wheel from [Bintray](https://bintray.com/fredrikaverpil/pyside2-wheels/pyside2/_latestVersion#files).
2. "pip install" the downloaded wheel: `pip install PySide2*.whl`
3. Avoid @rpath errors: `export DYLD_LIBRARY_PATH=/usr/local/lib/python3.5/site-packages/PySide2/` (see [this PySide(1) issue](https://github.com/PySide/PySide/issues/129) for more information)
4. Test it: `python3 -c "from PySide2 import QtWidgets, QtCore"`

<br><br>

## Contributing to this project

Fork this project and create a pull request against the `develop` branch. Wheels will be built for each commit you do, but they won't get uploaded to the Bintray [development package](https://bintray.com/fredrikaverpil/pyside2-wheels/development/_latestVersion#files) until the pull request is merged.
