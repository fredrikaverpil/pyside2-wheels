# Homebrew already provided by Travis CI
# /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" && \

# Xcode already provided by Travis CI
# xcode-select --install && \
# sudo xcodebuild -license && \

brew update && \
brew install python3 && \
brew install qt5 cmake libxslt libxml2 openssl && \
git clone --recursive https://codereview.qt-project.org/pyside/pyside-setup ~/pyside-setup && \
python3 ~/pyside-setup/setup.py bdist_wheel --ignore-git --qmake=/usr/local/Cellar/qt5/5.6.1-1/bin/qmake --cmake=/usr/local/bin/cmake --openssl=/usr/local/Cellar/openssl/1.0.2h_1/bin