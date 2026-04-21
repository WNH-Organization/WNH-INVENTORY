#!/bin/bash

# 1. Find the highest existing WNH number (Defaults to 000 if empty)
LAST_ID=$(ls content/hardware/ 2>/dev/null | grep -oE 'wnh-[0-9]+' | grep -oE '[0-9]+' | sort -n | tail -1)
LAST_ID=${LAST_ID:-0}

# 2. Increment by 1 and pad with zeros (e.g., 4 becomes 005)
NEXT_ID=$(printf "%03d" $((10#$LAST_ID + 1)))

echo "Next Asset ID is WNH-$NEXT_ID"
echo "---------------------------"

# 3. Prompt for device details
read -p "Enter device name (e.g., raspberry pi 4): " DEVICE_NAME
read -p "Enter device class (e.g., Router, SBC, Smartphone): " DEVICE_CLASS
read -p "Enter donor name (leave blank for Anonymous): " DONOR_NAME

# If donor name is left blank, default to "Anonymous"
DONOR_NAME=${DONOR_NAME:-Anonymous}

# 4. Format the name for the URL (lowercase, replace spaces with dashes)
SLUG=$(echo "$DEVICE_NAME" | tr '[:upper:]' '[:lower:]' | tr ' ' '-')
FILENAME="wnh-${NEXT_ID}-${SLUG}.md"

# 5. Tell Hugo to generate the file using the archetype
hugo new "hardware/${FILENAME}"

# 6. Automatically inject the correct data into the generated file using sed
sed -i "s/WNH-TBD/WNH-${NEXT_ID}/" "content/hardware/${FILENAME}"
sed -i "s/CLASS-TBD/${DEVICE_CLASS}/" "content/hardware/${FILENAME}"
sed -i "s/DONOR-TBD/${DONOR_NAME}/" "content/hardware/${FILENAME}"

echo "---------------------------"
echo "Success! WNH-${NEXT_ID} registered to ${DONOR_NAME}."
echo "Opening file..."

# Open the new file in Neovim (or your system default editor)
${EDITOR:-nvim} "content/hardware/${FILENAME}"
