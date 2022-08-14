#!/bin/bash
#########################################################################
#
# Name: asset-cleanup.sh
# Subscription: This script removes exif data of added images
#
#########################################################################

main() {
    exif_cleaner
}

# Prune exif data
exif_cleaner() {

    ./bin/exiftool -all:all= -r ../src
    echo -e "\nMetadata was cleaned up!\n"
}

main
