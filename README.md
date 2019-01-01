# Debian packaging for nixnote2

Note that packaging for nixnote2 itself is now moved to main repo: https://github.com/robert7/nixnote2

Here remains:

* recipes for libtidy 5.6 & helper scripts.
* Qt webkit binary build (with docker)

Test run packaging (approximate local simulation; probably quite naive version, but works someway :) ):
```bash
# ppa is used for nixnote2-tidy (see https://github.com/robert7/nixnote2/wiki/NixNote-PPA)
sudo add-apt-repository ppa:nixnote/nixnote2-stable
sudo apt-get update

sudo apt -y install dh-make git git-build-recipe javahelper default-jdk \
   libboost-dev libcurl4-openssl-dev libhunspell-dev libpoppler-qt5-dev \
   libqt5webkit5-dev libswscale-dev nixnote2-tidy qml qt5-qmake qtbase5-dev \
   qttools5-dev-tools build-essential pkg-config

git clone https://github.com/robert7/nixnote2-packaging.git
cd nixnote2-packaging

# test run part #1
./development/run-recipe.sh nixnote2 bionic

# if OK, then part #2:
./development/run-dh-seqs.sh nixnote2

# there is also all.sh for both parts
```
