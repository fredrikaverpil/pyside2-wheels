[![Build Status](https://travis-ci.org/fredrikaverpil/pyside2-wheels.svg?branch=master)](https://travis-ci.org/fredrikaverpil/pyside2-wheels)

# pyside2-wheels

Please note, the wheels being produced are not "portable" or "standalone" and do require Qt5 libraries installed locally.

Also see [this guide](https://fredrikaverpil.github.io/2016/08/17/compiling-pyside2/) on compiling PySide2 for other platforms.

## Wheels

### Ubuntu 16.04

```bash
# Build containers
docker build -f Dockerfile-ubuntu16.04-py2.7 -t fredrikaverpil/pyside2-ubuntu16.04-py2.7 .
docker build -f Dockerfile-ubuntu16.04-py3.5 -t fredrikaverpil/pyside2-ubuntu16.04-py3.5 .

# Build wheels
docker run --rm -v $(pwd):/pyside-setup/dist fredrikaverpil/pyside2-ubuntu16.04-py2.7
docker run --rm -v $(pwd):/pyside-setup/dist fredrikaverpil/pyside2-ubuntu16.04-py3.5
```

### CentOS 7

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
