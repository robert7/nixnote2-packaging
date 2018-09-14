#!/bin/bash

# this is approximation of test run for debian "rules"
# convenience helper only
# its not really exact, but may catch some mistakes
# it must be run *after* running recipe & any local changes must be copied manually

CDIR=`pwd`
echo Current dir: $CDIR
DEV_DIR=`dirname $0`
cd ${DEV_DIR}/..
PROJ_DIR=`pwd`
echo Project dir: $PROJ_DIR
. ${PROJ_DIR}/development/common-include.sh

cd build-tidy-html56/launchpad-recipe

dh clean --without=build-stamp                        || error_exit "dh clean"

#dh build-arch --without=build-stamp                   || error_exit "dh build-arch"

fakeroot dh binary --without=build-stamp              || error_exit "dh binary"

cd $CDIR


