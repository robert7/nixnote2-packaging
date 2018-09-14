#!/bin/bash

USE_DISTRIBUTION=bionic
CDIR=`pwd`
echo Current dir: $CDIR
DEV_DIR=`dirname $0`
cd ${DEV_DIR}/..
PROJ_DIR=`pwd`
echo Project dir: $PROJ_DIR
. ${PROJ_DIR}/development/common-include.sh

RECIPE_NAME=$1
if [ -z "${RECIPE_NAME}" ] || [ ! -d "${RECIPE_NAME}" ]; then
  echo "1st param must me recipe name (directory)"
  exit 1
fi


./development/clean.sh

git-build-recipe --allow-fallback-to-native --distribution ${USE_DISTRIBUTION} ./${RECIPE_NAME}/launchpad-recipe build-${RECIPE_NAME}

cd $CDIR

