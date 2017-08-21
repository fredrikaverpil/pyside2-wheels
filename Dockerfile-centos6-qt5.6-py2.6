# Always review the official build instructions before updating:
# https://wiki.qt.io/PySide2_GettingStarted#Building_PySide2

FROM centos:6

RUN yum install -y epel-release && \
    yum install -y deltarpm && \
    yum install -y centos-release-SCL && \
    yum install -y python python-libs python-devel python-pip && \
    yum groupinstall "Development Tools" -y && \
    # yum install -y python-libs python-devel python-pip && \
    yum install -y --skip-broken libxslt libxml2 libxml2-devel libxslt-devel cmake3 openssl && \
    yum install -y qt5-qtbase-devel && \
    yum install -y --skip-broken qt5*

# Set working directory
WORKDIR /workdir

# Upgrade pip
RUN pip install --upgrade pip

# Install pip packages
RUN pip install --upgrade setuptools wheel

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

            python setup.py \
                bdist_wheel \
                    --ignore-git \
                    --qmake=/usr/lib64/qt5/bin/qmake-qt5 \
                    --cmake=/usr/bin/cmake3 \
                    --jobs=3
