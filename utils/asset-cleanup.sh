#!/bin/bash

main() {
    exif_cleaner
}

# Prune exif data
exif_cleaner() {

    # Get exif tool
    DIR="./tmp/exiftool/"
    if ! [ -d "$DIR" ]; then
        mkdir -p ./tmp/exiftool/
        wget https://exiftool.org/Image-ExifTool-12.44.tar.gz
        gzip -dc Image-ExifTool-12.44.tar.gz | tar -xf -
        mv Image-ExifTool-12.44/* tmp/exiftool/
        rm Image-ExifTool-12.44.tar.gz
        rm -r Image-ExifTool-12.44
        cd tmp/exiftool
    fi

    # Run metadata removal
    ./exiftool -all:all= -r ../../src

    echo "All metadata removed!"
}

main
