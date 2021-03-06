#!/bin/bash
function repositories {
    add-apt-repository ppa:webupd8team/atom -y
    docker_repository
    apt update
}

function installer {
    apt install -y \
        atom \
        vim \
        docker-ce
    snap install spotify
}

function docker_repository {
    apt install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        software-properties-common

    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) \
        stable" -y
}

function post_installer {
    usermod -aG docker $USER
    apm install --packages-file atom_packages.txt
    echo -e "set nu\nset ts=4\nset bg=dark\nset expandtab" > ~/.vimrc
}

function postman {
    cd /tmp
    wget https://dl.pstmn.io/download/latest/linux64 -O postman.tar.gz
    tar -xzfv postman.tar.gz
    mv Postman /opt/
}

repositories
installer
post_installer
exit
