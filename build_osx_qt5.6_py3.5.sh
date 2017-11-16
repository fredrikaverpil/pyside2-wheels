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

# brew update
brew install https://raw.githubusercontent.com/Homebrew/homebrew-core/ec545d45d4512ace3570782283df4ecda6bb0044/Formula/python3.rb
brew install https://raw.githubusercontent.com/fredrikaverpil/pyside2-wheels/master/homebrew/qt5/5.6.1-1/qt5.rb
brew install libxslt libxml2

# OpenSSL already provided by Travis CI
# brew install openssl

# CMAke 3.0 already provided by Travis CI
# brew install cmake

git clone --recursive --branch 5.6 https://codereview.qt-project.org/pyside/pyside-setup ~/pyside-setup

# Fix bug https://bugreports.qt.io/browse/PYSIDE-552
sed -i.bak $'s/if(Qt5Designer_FOUND)/find_package(Qt5Designer)\\\nif(Qt5Designer_FOUND)/g' ~/pyside-setup/sources/pyside2/CMakeLists.txt

# Fix bug https://bugreports.qt.io/browse/PYSIDE-357
sed -i.bak $"s/packages = \['PySide2', 'pyside2uic'\],/packages = \['PySide2', 'pyside2uic'\, \'pyside2uic.Compiler\', \'pyside2uic.port_v\' + str(sys.version_info[0])],/g" ~/pyside-setup/setup.py

# Verify sed hacks
cat ~/pyside-setup/sources/pyside2/CMakeLists.txt
cat ~/pyside-setup/setup.py

python3 ~/pyside-setup/setup.py bdist_wheel --standalone --ignore-git --qmake=/usr/local/Cellar/qt5/5.6.1-1/bin/qmake --cmake=/usr/local/bin/cmake --openssl=/usr/local/Cellar/openssl/1.0.2h_1/bin --jobs=3
