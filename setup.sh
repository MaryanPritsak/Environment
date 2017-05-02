#!/bin/bash

set -e
set -x

#
# Git
#

sudo apt-get install -y git

git config --global alias.br 'branch'
git config --global alias.ci 'commit'
git config --global alias.co 'checkout'
git config --global alias.gr 'grep -n'
git config --global alias.st 'status'
git config --global alias.subdate 'submodule update --init --recursive'

#
# Vim
#

sudo apt-get install -y vim vim-nox-py2
