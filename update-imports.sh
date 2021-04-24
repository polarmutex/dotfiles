#!/bin/bash

# This script updates chezmoi imports I use

function update_import() {
    local archive_url=$1
    local destination=$2

    echo "Importing $1 into $2 ..."
    curl -s -L -o archive.tar.gz $1
    chezmoi import --strip-components 1 --destination $2 archive.tar.gz
    rm -f archive.tar.gz
}

#update_import https://github.com/robbyrussell/oh-my-zsh/archive/master.tar.gz ${HOME}/.oh-my-zsh
update_import https://github.com/BlingCorp/bling/archive/master.tar.gz ${HOME}/.config/awesome/bling
update_import https://github.com/lcpz/lain/archive/master.tar.gz ${HOME}/.config/awesome/lain
