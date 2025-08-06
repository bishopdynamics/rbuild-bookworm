#!/usr/bin/env bash

# log everything to file
exec > >(tee build.log) 2>&1

function announce {
    local MSG="$*"
    echo "################################################################################################################################"
    echo " $MSG - $(date)"
    echo "################################################################################################################################"
}


if ! sudo -n true 2>/dev/null; then
    echo "must have passwordless sudo setup"
    echo "  but dont run it as roon"
    exit 1
fi

announce "Starting build"

for BOARD in rock-pi-4a rock-pi-4c; do
    for FLAVOR in cli xfce; do
        announce "Building for: $BOARD $FLAVOR"
        ./rbuild --compress --shrink $BOARD bookworm $FLAVOR || {
            echo "Build failed for: $BOARD $FLAVOR"
            exit 1
        }
        echo "Build success"
    done
done

announce "All builds completed successfully"

