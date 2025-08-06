#!/usr/bin/env bash

set -e

if [ -z "$1" ] || [ -z "$2" ]; then
    echo "usage: ./flash.sh <source file> <output device>"
    echo "  ex: ./flash.sh rockpi-image.img /dev/sda"
    exit 1
fi

INPUT_FILE="${1:?}"
OUTPUT_DEVICE="${2:?}"

if [ ! -f "$INPUT_FILE" ]; then
    echo "ERROR: source file does not exist: $INPUT_FILE"
    exit 1
fi

if [ ! -b "$OUTPUT_DEVICE" ]; then
    echo "ERROR: output device is not a block device: $OUTPUT_DEVICE"
    exit 1
fi

INPUT_FILE_SIZE="$(stat -c '%s' "$INPUT_FILE" |numfmt --to=iec)"

echo ""
echo "Input file: $INPUT_FILE ($INPUT_FILE_SIZE)"

echo "Output device: $OUTPUT_DEVICE"
echo ""
echo "Press enter to continue, ctrl+c to quit"

# shellcheck disable=SC2034
read -r NOTHING

echo "Getting sudo..."
sudo echo "  Got sudo."

echo "writing data"

pv -pterab < "$INPUT_FILE" | sudo dd of="$OUTPUT_DEVICE" bs=1M || {
  echo "something went wrong!"
  exit 1
}
echo "Write completed successfully"
