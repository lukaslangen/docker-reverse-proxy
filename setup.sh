#!/bin/bash

PWD=$(pwd)
DEFAULT_FILE="$PWD/config/default"
CUSTOM_FILE="$PWD/config/custom"

function main {
    ensureRoot
    printInfo

    read -p "Should these entries be added to /etc/hosts? [Y/n]: " -r

    if [[ $REPLY == 'Y' ]]
    then
        echo "Adding entries to /etc/hosts..."

        addEntriesToHosts

        exit 0
    fi

    echo "Didn't add entries"
}

function ensureRoot {
    if [[ $(whoami) != 'root' ]]
    then
        echo 'This must be executed with the root user, as it modifies /etc/hosts'
        exit 1
    fi
}

function printInfo {
    echo "default:"
    printFile $DEFAULT_FILE
    echo

    echo "custom:"
    printFile $CUSTOM_FILE
    echo
}

function printFile {
    filename=$1

    while read -r line
    do
        echo "$line"
    done < "$filename"
}

function addEntriesToHosts {
    bash -c "cat $DEFAULT_FILE >> /etc/hosts"
    bash -c "cat $CUSTOM_FILE >> /etc/hosts"
}

main
