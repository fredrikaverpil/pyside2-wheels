[![Build Status](https://travis-ci.org/fredrikaverpil/pyside2-wheels.svg?branch=master)](https://travis-ci.org/fredrikaverpil/pyside2-wheels)

# pyside2-wheels

### Usage

1. Install Docker
2. Build the container
3. Run the container (which produces the wheel)

## Portability

The wheels being produced are not "portable" or "standalone" and do require Qt5 libraries installed locally.

## Guide

I wrote a guide on compiling PySide2 on other platforms [here](https://fredrikaverpil.github.io/2016/08/17/compiling-pyside2/).

## Wheels

### Generated in Ubuntu 16.04

```bash
# Build containers
docker build -f Dockerfile-Ubuntu16.04-py2.7 -t fredrikaverpil/pyside2-ubuntu16.04-py2.7 .
docker build -f Dockerfile-Ubuntu16.04-py3.5 -t fredrikaverpil/pyside2-ubuntu16.04-py3.5 .

# Build wheels
docker run --rm -v $(pwd):/pyside-setup/dist fredrikaverpil/pyside2-ubuntu16.04-py2.7
docker run --rm -v $(pwd):/pyside-setup/dist fredrikaverpil/pyside2-ubuntu16.04-py3.5
```

