# pyside2-wheels

[![Build Status](https://travis-ci.org/fredrikaverpil/pyside2-wheels.svg?branch=master)](https://travis-ci.org/fredrikaverpil/pyside2-wheels)

### Usage

1. Install Docker
2. Build the container
3. Run the container (which produces the wheel)

### Ubuntu 16.04

Build containers:

```bash
docker build -f Dockerfile-Ubuntu16.04-py2.7 -t fredrikaverpil/pyside2-ubuntu16.04-py2.7 .
docker build -f Dockerfile-Ubuntu16.04-py3.5 -t fredrikaverpil/pyside2-ubuntu16.04-py3.5 .
```

Build wheels:

```bash
docker run --rm -v $(pwd):/pyside-setup/dist fredrikaverpil/pyside2-ubuntu16.04-py2.7
docker run --rm -v $(pwd):/pyside-setup/dist fredrikaverpil/pyside2-ubuntu16.04-py3.5
```
