#!/bin/bash

DEV_DIR=`dirname $0`
. ${DEV_DIR}/common-include.sh

git-build-recipe --allow-fallback-to-native --distribution bionic ./tidy-html5/launchpad-recipe

