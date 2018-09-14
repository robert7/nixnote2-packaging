#!/bin/bash

CDIR=`pwd`
echo Current dir: $CDIR
DEV_DIR=`dirname $0`
cd ${DEV_DIR}/..
PROJ_DIR=`pwd`
echo Project dir: $PROJ_DIR
. ${PROJ_DIR}/development/common-include.sh


./development/clean.sh

git-build-recipe --allow-fallback-to-native --distribution bionic ./tidy-html56/launchpad-recipe build-tidy-html56

cd $CDIR

