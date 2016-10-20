[![Build Status](https://travis-ci.org/fredrikaverpil/pyside2-wheels.svg?branch=master)](https://travis-ci.org/fredrikaverpil/pyside2-wheels) [![Build Status](https://ci.appveyor.com/api/projects/status/plmqonu08rea3s4f/branch/master?svg=true)](https://ci.appveyor.com/project/fredrikaverpil/pyside2-wheels) [ ![Download](https://api.bintray.com/packages/fredrikaverpil/pyside2-wheels/pyside2/images/download.svg) ](https://bintray.com/fredrikaverpil/pyside2-wheels/pyside2/_latestVersion#files)

# pyside2-wheels

> Note: The wheels being produced are not "portable" or "standalone" and do require Qt5 libraries installed locally. This project could potentially implement such features by using [multibind](https://github.com/matthew-brett/multibuild) or looking at [how it can be done with PyQt5](https://github.com/pyqt/python-qt5/wiki/Updating-the-repository#bundling).

For more information, see [this guide](https://fredrikaverpil.github.io/2016/08/17/compiling-pyside2/) on compiling PySide2.

<br><br>

## Contents

* Quickstart
  * Ubuntu 14.04, Python 2.7
  * Mac OS X
* Wheel building info
  * Ubuntu 14.04, 16.04
  * CentOS 6, 7
  * Mac OS X 10.9.5
  * Windows
* Contributing to this project
* Qt development and bug reporting

<br><br>

### Quickstart

Pre-built wheels for Python 2.7 and 3.4 on each platform are available on [Bintray](https://bintray.com/fredrikaverpil/pyside2-wheels/pyside2/_latestVersion#files).

**Ubuntu 14.04, Python 2.7**

```bash
# Prerequisities
$ apt-get install wget python-pip python-dev software-properties-common
$ add-apt-repository ppa:beineri/opt-qt561-trusty
$ apt-get update
$ apt-get install qt56-meta-full
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

**Mac OS X, Python 2.7**

```bash
# Prerequisities
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
$ brew update
$ brew install qt5

# Install
$ wget https://bintray.com/fredrikaverpil/pyside2-wheels/download_file?file_path=osx10.9.5%2FPySide2-2.0.0.dev0-cp27-cp27m-macosx_10_9_x86_64.whl -O PySide2-2.0.0.dev0-cp27-cp27m-macosx_10_9_x86_64.whl
$ pip install PySide2-2.0.0.dev0-cp27-cp27m-macosx_10_9_x86_64.whl

# Fix linking problems (ugly fix) - more info at https://github.com/PySide/PySide/issues/129
$ export DYLD_LIBRARY_PATH=/usr/local/lib/python3.5/site-packages/PySide2/

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


## Wheel building info

Wheels are created by Travis CI (Linux, OS X) and AppVeyor (Windows). They are then uploaded to Bintray:

* [pyside2-wheels/pyside2](https://bintray.com/fredrikaverpil/pyside2-wheels/pyside2#files) - wheels built from the master branch
* [pyside2-wheels/development](https://bintray.com/fredrikaverpil/pyside2-wheels/development#files) - wheels built from any non-master branch

Qt5 is supported on [these platforms](http://doc.qt.io/qt-5/supported-platforms.html).

### Ubuntu 14.04, 16.04

Note: Many modules are missing during PySide2 wheel building in Ubuntu 16.04: [PYSIDE-343](https://bugreports.qt.io/browse/PYSIDE-343)

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

**Ubuntu 14.04 modules list as of 2016-10-20:**

```
module Qt5Core found
module Qt5Concurrent found
module Qt5Gui found
module Qt5Widgets found
module Qt5PrintSupport found
module Qt5Xml found
module Qt5XmlPatterns found
module Qt5Svg found
module Qt5PrintSupport found
module Qt5Sql found
module Qt5Designer found
module Qt5UiTools found
module Qt5Test found
module Qt5Network found
-- optional module Qt5WebKit skipped
-- optional module Qt5WebKitWidgets skipped
module Qt5Script found
module Qt5ScriptTools found
module Qt5Help found
module Qt5Multimedia found
module Qt5Quick found
module Qt5Qml found
module Qt5QuickWidgets found
module Qt5WebEngineWidgets found
module Qt5WebChannel found
module Qt5WebSockets found
module Qt5X11Extras found
-- Checking for QAbstractPrintDialog in Qt5Widgets -- not found
-- Checking for QGtkStyle in Qt5Widgets -- not found
-- Checking for QPageSetupDialog in Qt5Widgets -- not found
-- Checking for QPrintDialog in Qt5Widgets -- not found
-- Checking for QPrintEngine in Qt5Widgets -- not found
-- Checking for QPrintPreviewDialog in Qt5Widgets -- not found
-- Checking for QPrintPreviewWidget in Qt5Widgets -- not found
-- Checking for QPrinter in Qt5Widgets -- not found
-- Checking for QPrinterInfo in Qt5Widgets -- not found
-- Checking for QSessionManager in Qt5Widgets -- not found
-- Checking for QSizeGrip in Qt5Widgets -- not found
-- Checking for QSystemTrayIcon in Qt5Widgets -- not found
-- Checking for QMacStyle in Qt5Widgets -- not found
-- Checking for QSslCertificate in QtNetwork -- not found
-- Checking for QSslCipher in QtNetwork -- not found
-- Checking for QSslConfiguration in QtNetwork -- not found
-- Checking for QSslError in QtNetwork -- not found
-- Checking for QSslKey in QtNetwork -- not found
-- Checking for QSslSocket in QtNetwork -- not found
```

**Ubuntu 16.04, modules list as of 2016-10-20:**

```
module Qt5Core found
module Qt5Concurrent found
module Qt5Gui found
module Qt5Widgets found
module Qt5PrintSupport found
module Qt5Xml found
module Qt5XmlPatterns found
-- optional module Qt5Svg skipped
module Qt5PrintSupport found
-- optional module Qt5Designer skipped
-- optional module Qt5UiTools skipped
module Qt5Sql found
module Qt5Test found
module Qt5Network found
-- optional module Qt5WebKit skipped
-- optional module Qt5WebKitWidgets skipped
-- optional module Qt5Script skipped
-- optional module Qt5ScriptTools skipped
-- optional module Qt5Help skipped
-- optional module Qt5Multimedia skipped
-- optional module Qt5Quick skipped
-- optional module Qt5Qml skipped
-- optional module Qt5QuickWidgets skipped
-- optional module Qt5WebEngineWidgets skipped
-- optional module Qt5WebChannel skipped
-- optional module Qt5WebSockets skipped
-- optional module Qt5X11Extras skipped
-- Checking for QAbstractPrintDialog in Qt5Widgets -- not found
-- Checking for QGtkStyle in Qt5Widgets -- not found
-- Checking for QPageSetupDialog in Qt5Widgets -- not found
-- Checking for QPrintDialog in Qt5Widgets -- not found
-- Checking for QPrintEngine in Qt5Widgets -- not found
-- Checking for QPrintPreviewDialog in Qt5Widgets -- not found
-- Checking for QPrintPreviewWidget in Qt5Widgets -- not found
-- Checking for QPrinter in Qt5Widgets -- not found
-- Checking for QPrinterInfo in Qt5Widgets -- not found
-- Checking for QSessionManager in Qt5Widgets -- not found
-- Checking for QSizeGrip in Qt5Widgets -- not found
-- Checking for QSystemTrayIcon in Qt5Widgets -- not found
-- Checking for QMacStyle in Qt5Widgets -- not found
-- Checking for QSslCertificate in QtNetwork -- not found
-- Checking for QSslCipher in QtNetwork -- not found
-- Checking for QSslConfiguration in QtNetwork -- not found
-- Checking for QSslError in QtNetwork -- not found
-- Checking for QSslKey in QtNetwork -- not found
-- Checking for QSslSocket in QtNetwork -- not found
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

**CentOS 6, 7 modules list as of 2016-10-20:**

```
module Qt5Core found
module Qt5Concurrent found
module Qt5Gui found
module Qt5Widgets found
module Qt5PrintSupport found
module Qt5Xml found
module Qt5XmlPatterns found
module Qt5Svg found
module Qt5PrintSupport found
module Qt5Sql found
module Qt5Designer found
module Qt5UiTools found
module Qt5Test found
module Qt5Network found
module Qt5WebKit found
module Qt5WebKitWidgets found
module Qt5Script found
module Qt5ScriptTools found
module Qt5Help found
module Qt5Multimedia found
module Qt5Quick found
module Qt5Qml found
module Qt5QuickWidgets found
-- optional module Qt5WebEngineWidgets skipped
module Qt5WebChannel found
module Qt5WebSockets found
module Qt5X11Extras found
-- Checking for QAbstractPrintDialog in Qt5Widgets -- not found
-- Checking for QGtkStyle in Qt5Widgets -- not found
-- Checking for QPageSetupDialog in Qt5Widgets -- not found
-- Checking for QPrintDialog in Qt5Widgets -- not found
-- Checking for QPrintEngine in Qt5Widgets -- not found
-- Checking for QPrintPreviewDialog in Qt5Widgets -- not found
-- Checking for QPrintPreviewWidget in Qt5Widgets -- not found
-- Checking for QPrinter in Qt5Widgets -- not found
-- Checking for QPrinterInfo in Qt5Widgets -- not found
-- Checking for QSessionManager in Qt5Widgets -- not found
-- Checking for QSizeGrip in Qt5Widgets -- not found
-- Checking for QSystemTrayIcon in Qt5Widgets -- not found
-- Checking for QMacStyle in Qt5Widgets -- not found
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
chmod +x build_osx_py2.7.sh
chmod +x build_osx_py3.5.sh

# Install prerequisites and build wheels
./build_osx_py2.7.sh
./build_osx_py3.5.sh
```

**Mac OS X modules list as of 2016-10-20:**

```
module Qt5Core found
module Qt5Concurrent found
module Qt5Gui found
module Qt5Widgets found
module Qt5PrintSupport found
module Qt5Xml found
module Qt5XmlPatterns found
module Qt5Svg found
module Qt5PrintSupport found
module Qt5Sql found
module Qt5Designer found
module Qt5UiTools found
module Qt5Test found
module Qt5Network found
-- optional module Qt5WebKit skipped
-- optional module Qt5WebKitWidgets skipped
module Qt5Script found
module Qt5ScriptTools found
module Qt5Help found
module Qt5Multimedia found
module Qt5Quick found
module Qt5Qml found
module Qt5QuickWidgets found
module Qt5WebEngineWidgets found
module Qt5WebChannel found
module Qt5WebSockets found
-- Checking for QAbstractPrintDialog in Qt5Widgets -- not found
-- Checking for QGtkStyle in Qt5Widgets -- not found
-- Checking for QPageSetupDialog in Qt5Widgets -- not found
-- Checking for QPrintDialog in Qt5Widgets -- not found
-- Checking for QPrintEngine in Qt5Widgets -- not found
-- Checking for QPrintPreviewDialog in Qt5Widgets -- not found
-- Checking for QPrintPreviewWidget in Qt5Widgets -- not found
-- Checking for QPrinter in Qt5Widgets -- not found
-- Checking for QPrinterInfo in Qt5Widgets -- not found
-- Checking for QSessionManager in Qt5Widgets -- not found
-- Checking for QSizeGrip in Qt5Widgets -- not found
-- Checking for QSystemTrayIcon in Qt5Widgets -- not found
-- Checking for QMacStyle in Qt5Widgets -- not found
-- Checking for QSslCertificate in QtNetwork -- not found
-- Checking for QSslCipher in QtNetwork -- not found
-- Checking for QSslConfiguration in QtNetwork -- not found
-- Checking for QSslError in QtNetwork -- not found
-- Checking for QSslKey in QtNetwork -- not found
-- Checking for QSslSocket in QtNetwork -- not found
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


## Contributing to this project

Fork this project and create a pull request against the `develop` branch. Wheels will be built for each commit you do, but they won't get uploaded to the Bintray [development package](https://bintray.com/fredrikaverpil/pyside2-wheels/development/_latestVersion#files) until the pull request is merged.

<br><br>


## Qt development and bug reporting

As of writing this, PySide2 is in its infancy and has actually not been released just yet (please note the version number). It's possible to follow the development and get in touch with developers. Here's a quick list of useful links for that.

* [PySide2 wiki](https://wiki.qt.io/PySide2)
* [PySide2 bug tracker](https://bugreports.qt.io/browse/PYSIDE/)
* [PySide2 git repositories](https://codereview.qt-project.org/#/admin/projects/?filter=pyside) - please note, RSS feeds are available
* [PySide2 gitter](https://gitter.im/PySide/pyside2) or #qt-pyside on irc.freenode.net (replaces the former #pyside channel, after PySide moved into Qt)
* [PySide2 mailing list](http://lists.qt-project.org/mailman/listinfo/pyside) - ([archives](http://dir.gmane.org/gmane.comp.lib.qt.pyside))
* [Qt language bindings forum](https://forum.qt.io/category/15/language-bindings)
