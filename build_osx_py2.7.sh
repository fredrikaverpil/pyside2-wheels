# Homebrew already provided by Travis CI
# /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" && \

# Xcode already provided by Travis CI
# xcode-select --install && \
# sudo xcodebuild -license && \

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
brew update
brew install qt5 libxslt libxml2

# OpenSSL already provided by Travis CI
# brew install openssl && \

# CMake 3.0 already provided by Travis CI
# brew install cmake && \

git clone --recursive https://codereview.qt-project.org/pyside/pyside-setup ~/pyside-setup
# python ~/pyside-setup/setup.py bdist_wheel --ignore-git --qmake=/usr/local/Cellar/qt5/5.6.1-1/bin/qmake --cmake=/usr/local/bin/cmake --openssl=/usr/local/Cellar/openssl/1.0.2h_1/bin
python ~/pyside-setup/setup.py bdist_wheel --ignore-git --qmake=/usr/local/Cellar/qt5/5.7.0/bin/qmake --cmake=/usr/local/bin/cmake --openssl=/usr/local/Cellar/openssl/1.0.2h_1/bin