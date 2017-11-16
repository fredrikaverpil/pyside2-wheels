[![Build Status](https://travis-ci.org/fredrikaverpil/pyside2-wheels.svg?branch=master)](https://travis-ci.org/fredrikaverpil/pyside2-wheels) [![Build Status](https://ci.appveyor.com/api/projects/status/plmqonu08rea3s4f/branch/master?svg=true)](https://ci.appveyor.com/project/fredrikaverpil/pyside2-wheels) [ ![Download](https://api.bintray.com/packages/fredrikaverpil/pyside2-wheels/pyside2/images/download.svg) ](https://bintray.com/fredrikaverpil/pyside2-wheels/pyside2/_latestVersion#files)

# pyside2-wheels

This project aims to build PySide2 wheels on multiple platforms using Travis-CI and Appveyor.

:fire: Please cast a vote [here](https://bugreports.qt.io/browse/PYSIDE-558) to have QtC prioritize the development of official PySide2 wheels.

:warning: The wheels being produced here are not "portable" or "standalone" and do require Qt5 libraries installed locally.

:cake: PySide2 can now be installed [with `conda`](https://github.com/conda-forge/pyside2-feedstock).

:newspaper: The Qt Company [officially supports](https://bugreports.qt.io/browse/PYSIDE-558?focusedCommentId=378913&page=com.atlassian.jira.plugin.system.issuetabpanels%3Acomment-tabpanel#comment-378913) the `--standalone` option, which should create standalone wheels.


## Quickstart

Pre-built wheels are available on [Bintray](https://bintray.com/fredrikaverpil/pyside2-wheels/pyside2/_latestVersion#files) and can be installed as long as prerequisites are in place (see [QUICKSTART.md](QUICKSTART.md)).

* [pyside2-wheels/pyside2](https://bintray.com/fredrikaverpil/pyside2-wheels/pyside2#files) - wheels built from the master branch
* [pyside2-wheels/development](https://bintray.com/fredrikaverpil/pyside2-wheels/development#files) - wheels built from any non-master branch


## Wheel building details

If you wish to build the wheel yourself or see more details on what's included in the wheels:

- [CENTOS.md](CENTOS.md)
- [UBUNTU.md](UBUNTU.md)
- [MACOS.md](MACOS.md)
- [WINDOWS.md](WINDOWS.md)

For more information on building PySide2, see [this guide](https://fredrikaverpil.github.io/2016/08/17/compiling-pyside2/).


## Contributing to this project

Please see [CONTRIBUTING.md](CONTRIBUTING.md).


## Qt development and bug reporting

It's possible to follow the development and get in touch with developers. Here's a quick list of useful links for that.

* [PySide2 wiki](https://wiki.qt.io/PySide2)
* [PySide2 bug tracker](https://bugreports.qt.io/browse/PYSIDE/)
* [PySide2 git repositories](https://codereview.qt-project.org/#/admin/projects/?filter=pyside) - please note, RSS feeds are available
* [PySide2 gitter](https://gitter.im/PySide/pyside2) or #qt-pyside on irc.freenode.net (replaces the former #pyside channel, after PySide moved into Qt)
* [PySide2 mailing list](http://lists.qt-project.org/mailman/listinfo/pyside) - ([archives](http://dir.gmane.org/gmane.comp.lib.qt.pyside))
* [Qt language bindings forum](https://forum.qt.io/category/15/language-bindings)
