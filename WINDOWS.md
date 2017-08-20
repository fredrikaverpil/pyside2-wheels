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


