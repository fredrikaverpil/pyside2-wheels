### Ubuntu 14.04, 16.04

#### Known issues

- `PySide2.QtUiTools` not available on Trusty: https://github.com/fredrikaverpil/pyside2-wheels/issues/74
- PySide2 build crashes with Python 3.6 when building `shiboken2`.


```bash
# Build containers
docker build -f Dockerfile-ubuntu14.04-qt5.6-py2.7 -t fredrikaverpil/pyside2-ubuntu14.04-qt5.6-py2.7 .
docker build -f Dockerfile-ubuntu14.04-qt5.6-py3.4 -t fredrikaverpil/pyside2-ubuntu14.04-qt5.6-py3.4 .
docker build -f Dockerfile-ubuntu16.04-qt5.6-py2.7 -t fredrikaverpil/pyside2-ubuntu16.04-qt5.6-py2.7 .
docker build -f Dockerfile-ubuntu16.04-qt5.6-py3.5 -t fredrikaverpil/pyside2-ubuntu16.04-qt5.6-py3.5 .

# Build wheels
docker run --rm -v $(pwd):/workdir/pyside-setup/dist fredrikaverpil/pyside2-ubuntu14.04-qt5.6-py2.7
docker run --rm -v $(pwd):/workdir/pyside-setup/dist fredrikaverpil/pyside2-ubuntu14.04-qt5.6-py3.4
docker run --rm -v $(pwd):/workdir/pyside-setup/dist fredrikaverpil/pyside2-ubuntu16.04-qt5.6-py2.7
docker run --rm -v $(pwd):/workdir/pyside-setup/dist fredrikaverpil/pyside2-ubuntu16.04-qt5.6-py3.5
```

**Ubuntu 14.04, Python 2.7 modules list as of 2017-08-20:**

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

**Ubuntu 14.04, Python 3.4 modules list as of 2017-08-20:**

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
-- optional module Qt5WebKit skipped
-- optional module Qt5WebKitWidgets skipped
-- module Qt5WebSockets found (opt)
-- Detected OS: x11
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

**Ubuntu 16.04, Python 2.7 modules list as of 2017-08-20:**

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

**Ubuntu 16.04, Python 3.5 modules list as of 2017-08-20:**

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
