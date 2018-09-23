#!/bin/bash

CDIR=`pwd`
echo Current dir: $CDIR
DEV_DIR=`dirname $0`
cd ${DEV_DIR}/..
PROJ_DIR=`pwd`
echo Project dir: $PROJ_DIR
. ${PROJ_DIR}/development/common-include.sh

RECIPE_NAME=$1
if [ -z "${RECIPE_NAME}" ] ; then
  RECIPE_NAME=nixnote2
fi
USE_DISTRIBUTION=$2


./development/clean.sh && \
  ./development/run-recipe.sh ${RECIPE_NAME} ${USE_DISTRIBUTION} && \
  ./development/run-dh-seqs.sh ${RECIPE_NAME}


