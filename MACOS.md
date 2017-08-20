### Mac OS X 10.9.5

```bash
# Make scripts executable
chmod +x build_osx_qt5.6_py2.7.sh
chmod +x build_osx_qt5.6_py3.5.sh
chmod +x build_osx_qt5.6_py3.6.sh

# Install prerequisites and build wheels
./build_osx_qt5.6_py2.7.sh
./build_osx_qt5.6_py3.5.sh
./build_osx_qt5.6_py3.6.sh
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
