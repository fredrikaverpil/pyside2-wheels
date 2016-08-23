[![Build Status](https://travis-ci.org/fredrikaverpil/pyside2-wheels.svg?branch=master)](https://travis-ci.org/fredrikaverpil/pyside2-wheels) [![Build Status](https://ci.appveyor.com/api/projects/status/plmqonu08rea3s4f/branch/master?svg=true)](https://ci.appveyor.com/project/fredrikaverpil/pyside2-wheels) [ ![Download](https://api.bintray.com/packages/fredrikaverpil/pyside2-wheels/pyside2/images/download.svg) ](https://bintray.com/fredrikaverpil/pyside2-wheels/development/_latestVersion)

# pyside2-wheels

:warning: Please note, the wheels being produced are not "portable" or "standalone" and do require Qt5 libraries installed locally. This project could potentially implement such features by looking at [how PyQt5 does this](https://github.com/pyqt/python-qt5/wiki/Updating-the-repository#bundling).

For more information, see [this guide](https://fredrikaverpil.github.io/2016/08/17/compiling-pyside2/) on compiling PySide2.

## Wheels

Wheels are created by Travis CI (Linux, OS X) and AppVeyor (Windows). They are then uploaded to [Bintray](https://bintray.com/fredrikaverpil/pyside2-wheels/).

### Ubuntu 16.04

:warning: Please note, not all modules are found during PySide2 wheel building: [PYSIDE-343](https://bugreports.qt.io/browse/PYSIDE-343)

```bash
# Build containers
docker build -f Dockerfile-ubuntu16.04-py2.7 -t fredrikaverpil/pyside2-ubuntu16.04-py2.7 .
docker build -f Dockerfile-ubuntu16.04-py3.5 -t fredrikaverpil/pyside2-ubuntu16.04-py3.5 .

# Build wheels
docker run --rm -v $(pwd):/pyside-setup/dist fredrikaverpil/pyside2-ubuntu16.04-py2.7
docker run --rm -v $(pwd):/pyside-setup/dist fredrikaverpil/pyside2-ubuntu16.04-py3.5
```

### CentOS 7

:bulb: Please note, a hack was implemented to work around this issue: [PYSIDE-342](https://bugreports.qt.io/browse/PYSIDE-342)

```bash
# Build containers
docker build -f Dockerfile-centos7-py2.7 -t fredrikaverpil/pyside2-centos7-py2.7 .
docker build -f Dockerfile-centos7-py3.5 -t fredrikaverpil/pyside2-centos7-py3.5 .

# Build wheels
docker run --rm -v $(pwd):/pyside-setup/dist fredrikaverpil/pyside2-centos7-py2.7
docker run --rm -v $(pwd):/pyside-setup/dist fredrikaverpil/pyside2-centos7-py3.5
```

### Mac OS X

```bash
# Make scripts executable
chmod +x build_osx_py2.7.sh
chmod +x build_osx_py3.5.sh

# Install prerequisites and build wheels
./build_osx_py2.7.sh
./build_osx_py3.5.sh
```

### Windows

:pencil2: Please note, no wheels are built for Python 2.7 since it is built using MSVC2008 (v9.0) and no Qt5 binaries (after Qt 5.5.1) were built with MSVC2008.

:warning: PySide2 wheels can be successfully built for Python 2.7 (MSVC2008) using Qt 5.6 and MSVC2015 (v14.0), although this can lead to hard-to-track issues since MSVC versions were mixed. Therefore this method isn't recommended. One workaround could be to build Python 2.7 from source, using an MSVC version also used to build Qt5.

Download and install:

* [Microsoft C++ Visual Studio 2015, v14.0 (MSVC2015)](https://www.visualstudio.com/)
* [CMake](https://cmake.org/download) >= v3.0
* [OpenSSL](https://sourceforge.net/projects/openssl)
* Qt5 compiled with MSVC2015 from the [Qt archives](https://download.qt.io/archive/qt/)
* [Python](https://www.python.org)

Please see [`appveyor.yml`](https://github.com/fredrikaverpil/pyside2-wheels/blob/master/appveyor.yml) for build commands.
