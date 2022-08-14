#!/bin/bash
#########################################################################
#
# Name: asset-linter.sh
# Subscription: This script checks the added images for the right filesize and extension
#
#########################################################################

# Get all files inside of src/*
main() {
    LINT_FAILED=0

    # Iterate over each directory and run tests
    for DIR in src/*; do
        for FILE in "$DIR"/*; do
            if ! test_extension; then
                LINT_FAILED=1
            fi
            if ! test_filesize; then
                LINT_FAILED=1
            fi
        done
    done

    # Set result based on tests passed or failed tests
    if [ "$LINT_FAILED" == 0 ]; then
        echo "Lint passed!"
        exit 0
    else
        echo "Lint failed!"
        exit 1
    fi
}

# Check file extension
test_extension() {
    if [ "${FILE: -4}" != ".png" ] && [ "${FILE: -4}" != ".jpg" ] && [ "${FILE: -4}" != ".webp" ]; then
        echo "$FILE failed extension test!"
        exit 1
    fi
}

# Check file size
test_filesize() {
    MAX_IMAGE_FILESIZE_BYTES=1000000
    MAX_VIDEO_FILESIZE_BYTES=5000000

    FILESIZE_BYTES=$(wc -c "$FILE" | awk '{print $1}')

    # check videos
    if [ "$FILESIZE_BYTES" -gt "$MAX_VIDEO_FILESIZE_BYTES" ] && [ "${FILE: -4}" == ".mkv" ]; then
        echo "$FILE is larger than the max filesize ($MAX_VIDEO_FILESIZE_BYTES) at $FILESIZE_BYTES bytes."
        return 1
    # check images
    elif [ "$FILESIZE_BYTES" -gt "$MAX_IMAGE_FILESIZE_BYTES" ] && [ "${FILE: -4}" != ".mkv" ]; then
        echo "$FILE is larger than the max filesize ($MAX_IMAGE_FILESIZE_BYTES) at $FILESIZE_BYTES bytes."
        return 1
    fi
}

main
