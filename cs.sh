##########################################################
# File Name: cs.sh
# Author: ims
# Created Time: 2020年10月05日 星期一 11时01分27秒
##########################################################
#!/bin/bash
set -x -e
rm -rf .cs.files

find ./src -type f -name "*.h" -o -name "*.cc" -o -name "*.cpp" > .cs.files
find ./cmake-submodule/muduo/ -type f -name "*.h" -o -name "*.cc" -o -name "*.cpp" >> .cs.files

cscope -bkq -i .cs.files
