# Always review the official build instructions before updating:
# https://wiki.qt.io/PySide2_GettingStarted#Building_PySide2

# Info on the PPA used here: https://launchpad.net/~beineri

FROM ubuntu:16.04

RUN apt-get update && apt-get install -y \
        python3-pip python3-dev \
        build-essential git cmake libxml2 libxslt1.1 libxml2-dev libxslt1-dev \
        mesa-common-dev \
        software-properties-common python-software-properties \
        wget && \
    add-apt-repository ppa:beineri/opt-qt562-xenial && \
    apt-get update && \
    apt-get install -qq -y \
        qt56-meta-full qt56creator

# Environment variables as specified in /opt/qt56/bin/qt56-env.sh
ENV QT_BASE_DIR /opt/qt56
ENV QTDIR $QT_BASE_DIR
ENV PATH $QT_BASE_DIR/bin:$PATH
ENV LD_LIBRARY_PATH $QT_BASE_DIR/lib/x86_64-linux-gnu:$QT_BASE_DIR/lib:$LD_LIBRARY_PATH  # x86_64
# ENV LD_LIBRARY_PATH $QT_BASE_DIR/lib/i386-linux-gnu:$QT_BASE_DIR/lib:$LD_LIBRARY_PATH  # i386
ENV PKG_CONFIG_PATH $QT_BASE_DIR/lib/pkgconfig:$PKG_CONFIG_PATH

# Set working directory
WORKDIR /workdir

# Install cmake 3
RUN wget --quiet https://cmake.org/files/v3.5/cmake-3.5.2-Linux-x86_64.tar.gz
RUN tar -xf cmake-3.5.2-Linux-x86_64.tar.gz -C /opt

# Clone PySide2 repository
RUN git clone --recursive --branch 5.6 https://codereview.qt-project.org/pyside/pyside-setup

# Fix bug https://bugreports.qt.io/browse/PYSIDE-552
RUN sed -i.bak $'s/if(Qt5Designer_FOUND)/find_package(Qt5Designer)\\\nif(Qt5Designer_FOUND)/g' pyside-setup/sources/pyside2/CMakeLists.txt

# Fix bug https://bugreports.qt.io/browse/PYSIDE-357
RUN sed -i -e "s~\b\(packages\b.*\)],~\1, 'pyside2uic.Compiler', 'pyside2uic.port_v' + str(sys.version_info[0])],~" pyside-setup/setup.py

# Verify sed hacks
RUN cat pyside-setup/sources/pyside2/CMakeLists.txt
RUN cat pyside-setup/setup.py

# Build PySide2 wheel
ENTRYPOINT  \
            cd pyside-setup && \

            python3 setup.py \
                bdist_wheel \
                    --ignore-git \
                    --qmake=/opt/qt56/bin/qmake \
                    --cmake=/opt/cmake-3.5.2-Linux-x86_64/bin/cmake \
                    --jobs=3
