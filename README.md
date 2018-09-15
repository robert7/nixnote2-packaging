# Debian packaging for nixnote21 

..work in progress :) as I try to figure out the magic behind debian packages

Test run packaging (aproximate local simulation):
```bash
sudo apt -y install dh-make git git-build-recipe javahelper
git clone https://github.com/robert7/nixnote2-packaging.git
cd nixnote2-packaging

# test run part #1
./development/run-recipe.sh nixnote21 bionic

# if OK, then part #2:
./development/run-dh-seq.sh nixnote2d      d
```
