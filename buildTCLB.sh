#/bin/bash
set -e 
set -x

export LC_ALL=C
export PATH=/TCLB:/usr/local/cuda-10.0/bin:$PATH
export R_LIBS_USER=/opt/r_libs  
export LDFLAGS="-L/usr/lib/x86_64-linux-gnu/hdf5/openmpi/  $LDFLAGS" 
export CPPFLAGS="-I /usr/include/hdf5/openmpi $CPPFLAGS"

mkdir -p $TSD
cd $TSD 


BRANCH='master'

REPO='CFD-GO/TCLB.git'

git clone --branch=$BRANCH  https://github.com/$REPO
cd TCLB
make configure
./configure --enable-double --with-python --enable-paranoid --enable-cpp11 $CONFIGURE_FLAGS

#for MODEL in $(cat .travis.yml | grep "MODEL=" | sed 's/.*=//g'); do
for MODEL in "d2q9"; do
    make $MODEL
done;
#tools/tests.sh $MODEL
