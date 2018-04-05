#!/bin/bash

set -e

mkdir build
cd build
WD=`pwd`

# wxWidgets
cd $WD
wget https://github.com/wxWidgets/wxWidgets/releases/download/v3.1.0/wxWidgets-3.1.0.tar.bz2
tar jxf wxWidgets-3.1.0.tar.bz2
cd wxWidgets-3.1.0/build/msw
mingw32-make -f makefile.gcc SHARED=1 UNICODE=1 BUILD=release clean
mingw32-make -f makefile.gcc SHARED=1 UNICODE=1 BUILD=release

# bsd-xdr
cd $WD
wget https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/bsd-xdr/bsd-xdr-1.0.0.tar.gz
tar zxvf bsd-xdr-1.0.0.tar.gz
cd bsd-xdr-1.0.0
sed -i 's/%hh/%/g' src/test/test_data.c
make
mv mingw/libxdr.dll.a /mingw32/lib/
mv rpc /mingw32/include/

# cmake
cd $WD
pacman --sync --noconfirm --noprogressbar mingw-w64-i686-cmake
# cmake doesn't like sh
mv /usr/bin/sh.exe /usr/bin/sh-moved.exe

# plplot
cd $WD
wget http://downloads.sourceforge.net/project/plplot/plplot/5.11.1%20Source/plplot-5.11.1.tar.gz
tar zxf plplot-5.11.1.tar.gz
mkdir plplot-5.11.1/build
cd plplot-5.11.1/build
cmake .. -G "MinGW Makefiles"
make && make install

# GDL
cd $WD
# Dependancies for GDL
pacman --sync --noconfirm --noprogressbar mingw-w64-i686-readline mingw-w64-i686-libpng mingw-w64-i686-gsl mingw-w64-i686-pcre
cmake -G "MinGW Makefiles" ..
make
