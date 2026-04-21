#!/bin/bash

# 1. Find the highest existing WNH number
LAST_ID=$(ls content/hardware/ 2>/dev/null | grep -oE 'wnh-[0-9]+' | grep -oE '[0-9]+' | sort -n | tail -1)
LAST_ID=${LAST_ID:-0}
NEXT_ID=$(printf "%03d" $((10#$LAST_ID + 1)))

echo "Next Asset ID: WNH-$NEXT_ID"
echo "---------------------------"

# 2. Prompts
read -p "Device Name: " DEVICE_NAME
read -p "Device Class: " DEVICE_CLASS
read -p "Donor Name (blank for Anonymous): " DONOR_NAME
DONOR_NAME=${DONOR_NAME:-Anonymous}

# 3. Create the Leaf Bundle directory
SLUG=$(echo "$DEVICE_NAME" | tr '[:upper:]' '[:lower:]' | tr ' ' '-')
DIRNAME="wnh-${NEXT_ID}-${SLUG}"
TARGET_DIR="content/hardware/${DIRNAME}"

mkdir -p "$TARGET_DIR"
# Create subdirectories for photos
mkdir -p "${TARGET_DIR}/initial"
mkdir -p "${TARGET_DIR}/current"

# 4. Generate index.md inside that folder
# We use 'hugo new' but point it to the index.md inside our new folder
hugo new "hardware/${DIRNAME}/index.md"

# 5. Inject data
FINAL_FILE="${TARGET_DIR}/index.md"
sed -i "s/WNH-TBD/WNH-${NEXT_ID}/" "$FINAL_FILE"
sed -i "s/CLASS-TBD/${DEVICE_CLASS}/" "$FINAL_FILE"
sed -i "s/DONOR-TBD/${DONOR_NAME}/" "$FINAL_FILE"

echo "---------------------------"
echo "Directory created: $TARGET_DIR"
echo "Drop your images there and edit the metadata."

${EDITOR:-nvim} "$FINAL_FILE"