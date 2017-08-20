### CentOS 6, 7

```bash
# Build containers
docker build -f Dockerfile-centos6-qt5.6-py2.6 -t fredrikaverpil/pyside2-centos6-qt5.6-py2.6 .
docker build -f Dockerfile-centos6-qt5.6-py2.7 -t fredrikaverpil/pyside2-centos6-qt5.6-py2.7 .
docker build -f Dockerfile-centos6-qt5.6-py3.5 -t fredrikaverpil/pyside2-centos6-qt5.6-py3.5 .
docker build -f Dockerfile-centos7-qt5.6-py2.7 -t fredrikaverpil/pyside2-centos7-qt5.6-py2.7 .
docker build -f Dockerfile-centos7-qt5.6-py3.5 -t fredrikaverpil/pyside2-centos7-qt5.6-py3.5 .
docker build -f Dockerfile-centos7-qt5.6-py3.6 -t fredrikaverpil/pyside2-centos7-qt5.6-py3.6 .

# Build wheels
docker run --rm -v $(pwd):/pyside-setup/dist fredrikaverpil/pyside2-centos6-qt5.6-py2.6
docker run --rm -v $(pwd):/pyside-setup/dist fredrikaverpil/pyside2-centos6-qt5.6-py2.7
docker run --rm -v $(pwd):/pyside-setup/dist fredrikaverpil/pyside2-centos6-qt5.6-py3.5
docker run --rm -v $(pwd):/pyside-setup/dist fredrikaverpil/pyside2-centos7-qt5.6-py2.7
docker run --rm -v $(pwd):/pyside-setup/dist fredrikaverpil/pyside2-centos7-qt5.6-py3.5
docker run --rm -v $(pwd):/pyside-setup/dist fredrikaverpil/pyside2-centos7-qt5.6-py3.6
```

**CentOS 6, Python 2.6 modules list as of 2017-08-20:**

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
-- module Qt5UiTools found (opt)
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
  CMakeLists.txt:239 (COLLECT_MODULE_IF_FOUND)
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


**CentOS 6, Python 2.7 modules list as of 2017-08-20:**

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
-- module Qt5UiTools found (opt)
-- module Qt5WebChannel found (opt)
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
  CMakeLists.txt:239 (COLLECT_MODULE_IF_FOUND)
-- optional module Qt5WebEngineWidgets skipped
-- module Qt5WebKit found (opt)
-- module Qt5WebKitWidgets found (opt)
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

**CentOS 6, Python 3.5 modules list as of 2017-08-20:**

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
-- module Qt5UiTools found (opt)
-- module Qt5WebChannel found (opt)
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
  CMakeLists.txt:239 (COLLECT_MODULE_IF_FOUND)
-- optional module Qt5WebEngineWidgets skipped
-- module Qt5WebKit found (opt)
-- module Qt5WebKitWidgets found (opt)
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

**CentOS 6, Python 3.6 modules list as of 2017-08-20:**

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
-- module Qt5UiTools found (opt)
-- module Qt5WebChannel found (opt)
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
  CMakeLists.txt:239 (COLLECT_MODULE_IF_FOUND)
-- optional module Qt5WebEngineWidgets skipped
-- module Qt5WebKit found (opt)
-- module Qt5WebKitWidgets found (opt)
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

**CentOS 7, Python 2.7 modules list as of 2017-08-20:**

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
-- module Qt5UiTools found (opt)
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
  CMakeLists.txt:239 (COLLECT_MODULE_IF_FOUND)
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

**CentOS 7, Python 3.5 modules list as of 2017-08-20:**

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
-- module Qt5UiTools found (opt)
-- module Qt5WebChannel found (opt)
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
  CMakeLists.txt:239 (COLLECT_MODULE_IF_FOUND)
-- optional module Qt5WebEngineWidgets skipped
-- module Qt5WebKit found (opt)
-- module Qt5WebKitWidgets found (opt)
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

**CentOS 7, Python 3.6 modules list as of 2017-08-20:**

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
-- module Qt5UiTools found (opt)
-- module Qt5WebChannel found (opt)
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
  CMakeLists.txt:239 (COLLECT_MODULE_IF_FOUND)
-- optional module Qt5WebEngineWidgets skipped
-- module Qt5WebKit found (opt)
-- module Qt5WebKitWidgets found (opt)
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
