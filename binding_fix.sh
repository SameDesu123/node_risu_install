#!/bin/bash

# Set your Android NDK path here
ANDROID_NDK_PATH="$PWD/android-ndk-r21d"

# Path to the binding.gyp file relative to the current directory
BINDING_GYP_PATH="$PWD/node-canvas/binding.gyp"

# Check if the binding.gyp file exists
if [ ! -f "$BINDING_GYP_PATH" ]; then
  echo "binding.gyp file not found at $BINDING_GYP_PATH"
  exit 1
fi

# Backup the original binding.gyp file
cp "$BINDING_GYP_PATH" "${BINDING_GYP_PATH}.bak"

# Create a temporary file to hold the new content
TMP_FILE=$(mktemp)

# Add the android_ndk_path variable before the conditions block
awk -v ndk_path="$ANDROID_NDK_PATH" '
BEGIN { added = 0 }
/"conditions": \[/ && !added {
  print "  \"variables\": {"
  print "    \"android_ndk_path\": \"" ndk_path "\""
  print "  },"
  added = 1
}
{ print }
' "$BINDING_GYP_PATH" > "$TMP_FILE"

# Replace the original file with the new file
mv "$TMP_FILE" "$BINDING_GYP_PATH"

echo "binding.gyp file updated successfully."
