#!/bin/bash

# ############
# !! EXPERIMENTAL binary build of Qt WebKit https://github.com/annulen/webkit
# ############

PROJECTDIR=`pwd`
set -xe

NNQTVER=qt511
DOCKERMODIFIER=_$NNQTVER
DOCKERTAG=nixnote2_wk/xenial${DOCKERMODIFIER}
DOCKERFILE=./development/docker/Dockerfile.ubuntu_xenial${DOCKERMODIFIER}

function error_exit {
    echo "$0: ***********error_exit***********"
    echo "***********" 1>&2
    echo "*********** Failed: $1" 1>&2
    echo "***********" 1>&2
    cd ${CDIR}
    exit 1
}


if [ ! -f development/build-webkit-with-docker.sh ]; then
  echo "You seem to be in wrong directory. script MUST be run from the project directory."
  exit 1
fi



cd $PROJECTDIR
# create "builder" image
docker build -t ${DOCKERTAG} -f ${DOCKERFILE} ./development/docker

# cleanup
rm -rf appdir || error_exit "rm appdir"
mkdir appdir

time docker run \
   --rm \
   -v $PROJECTDIR/appdir:/opt/nixnote2/appdir \
   -it ${DOCKERTAG} \
      /bin/bash -c "cd /opt && git clone git://code.qt.io/qt/qtwebkit.git; source /opt/qt5*/bin/qt*-env.sh && cd qtwebkit && mkdir -p WebKitBuild/Release && cd WebKitBuild/Release && cmake -DPORT=Qt -DCMAKE_BUILD_TYPE=Release ../.. && make -j$(nproc) && make install && cd /opt/qtwebkit/WebKitBuild/Release && make DESTDIR=/opt/qtwebkit-$NNQTVER-binaries install && cd /opt/qtwebkit-$NNQTVER-binaries/opt/$NNQTVER && tar -zcf /opt/nixnote2/appdir/qtwebkit-$NNQTVER-binaries.tgz * && cd /opt"


