# Homebrew already provided by Travis CI
# /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" && \

# Xcode already provided by Travis CI
# xcode-select --install && \
# sudo xcodebuild -license && \

brew update && \
brew install python && \
brew install qt5 libxslt libxml2 && \

# OpenSSL already provided by Travis CI
# brew install openssl && \

# CMAke 3.0 already provided by Travis CI
# brew install cmake && \

# LDFLAGS:  -L/usr/local/opt/qt5/lib
# CPPFLAGS: -I/usr/local/opt/qt5/include
git clone --recursive https://codereview.qt-project.org/pyside/pyside-setup ~/pyside-setup && \

#
# Multibuild setup
#
echo "Multibuild!"
git clone --recursive https://github.com/matthew-brett/multibuild.git ~/multibuild
ls -alh ~/multibuild
REPO_DIR=~/pyside-setup
PLAT=x86_64
UNICODE_WIDTH=32
MB_PYTHON_VERSION=2.7
MULTIBUILD_DIR=~/multibuild
MB_PYTHON_VERSION=${MB_PYTHON_VERSION:-$TRAVIS_PYTHON_VERSION}
# BUILD_COMMIT=

# Dummy
echo "Creating config.sh"
echo "echo config" > config.sh
cp config.sh $MULTIBUILD_DIR

echo "common_utils.sh"
source $MULTIBUILD_DIR/common_utils.sh
echo "travis_steps.sh"
source $MULTIBUILD_DIR/travis_steps.sh

# NB - config.sh sourced at end of this function.
# config.sh can override any function defined here.

function before_install {
    export CC=clang
    export CXX=clang++
    get_macpython_environment $MB_PYTHON_VERSION venv
    source venv/bin/activate
    pip install --upgrade pip wheel
}

before_install

# build_wheel function defined in common_utils (via osx_utils)
# clean_code $REPO_DIR $BUILD_COMMIT
build_wheel $REPO_DIR $PLAT

# install_run function defined in common_utils
install_run $PLAT

# Local configuration may define custom pre-build, source patching.
# It can also overwrite the functions above.
source $MULTIBUILD_DIR/config.sh

# Build PySide2
# git clone --recursive https://codereview.qt-project.org/pyside/pyside-setup ~/pyside-setup && \
# python ~/pyside-setup/setup.py bdist_wheel --ignore-git --qmake=/usr/local/Cellar/qt5/5.6.1-1/bin/qmake --cmake=/usr/local/bin/cmake --openssl=/usr/local/Cellar/openssl/1.0.2h_1/bin

