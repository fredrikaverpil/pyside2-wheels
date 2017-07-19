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

brew update
brew install python3
brew install ./homebrew/qt5/5.6.1-1/qt5.rb
brew install libxslt libxml2

# OpenSSL already provided by Travis CI
# brew install openssl

# CMAke 3.0 already provided by Travis CI
# brew install cmake

git clone --recursive --branch 5.6 https://codereview.qt-project.org/pyside/pyside-setup ~/pyside-setup

python3 ~/pyside-setup/setup.py bdist_wheel --ignore-git --qmake=/usr/local/Cellar/qt5/5.6.1-1/bin/qmake --cmake=/usr/local/bin/cmake --openssl=/usr/local/Cellar/openssl/1.0.2h_1/bin