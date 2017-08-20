# Always review the official build instructions before updating:
# https://wiki.qt.io/PySide2_GettingStarted#Building_PySide2

# Homebrew already provided by Travis CI
# /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install Homebrew if not already installed
if test ! $(which brew)
then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Xcode already provided by Travis CI
# xcode-select --install
# sudo xcodebuild -license

# Check so that Python 2.7 is installed
if which python > /dev/null 2>&1;
then
    if ! [[ $(python --version 2>&1) =~ 2\.7 ]]
      then
        echo "Python 2.7.x not installed."
        exit 1
    fi
else
    echo "No Python executable is found."
    exit 1
fi

# Install pip (with wheel) unless it already exists
# This was added for Travis CI osx image "xcode6.4",
# which is equipped with Python 2.7.10 but does not
# have pip installed.
if test ! $(which pip)
then
  wget --no-check-certificate https://bootstrap.pypa.io/get-pip.py
  sudo python get-pip.py
  sudo pip install --upgrade pip
  sudo pip install --upgrade wheel
fi

# Install via Homebrew
# brew update
brew install https://raw.githubusercontent.com/fredrikaverpil/pyside2-wheels/master/homebrew/qt5/5.6.1-1/qt5.rb
brew install libxslt libxml2

# OpenSSL already provided by Travis CI
# brew install openssl

# CMake 3.0 already provided by Travis CI
# brew install cmake

git clone --recursive --branch 5.6 https://codereview.qt-project.org/pyside/pyside-setup ~/pyside-setup

# Fix bug https://bugreports.qt.io/browse/PYSIDE-552
RUN sed -i.bak $'s/if(Qt5Designer_FOUND)/find_package(Qt5Designer)\\\nif(Qt5Designer_FOUND)/g' ~/pyside-setup/sources/pyside2/CMakeLists.txt

python ~/pyside-setup/setup.py bdist_wheel --ignore-git --qmake=/usr/local/Cellar/qt5/5.6.1-1/bin/qmake --cmake=/usr/local/bin/cmake --openssl=/usr/local/Cellar/openssl/1.0.2h_1/bin --jobs=2
