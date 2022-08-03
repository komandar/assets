#!/bin/bash

main() {
    exif_cleaner
}

# Prune exif data
exif_cleaner() {

    ./bin/exiftool -all:all= -r ../src

    echo "All metadata removed!"
}

main
