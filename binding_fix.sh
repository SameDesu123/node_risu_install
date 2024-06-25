#!/bin/bash

# Set your Android NDK path here
ANDROID_NDK_PATH="$HOME/android-ndk-r21d"

# Path to the binding.gyp file
BINDING_GYP_PATH="$HOME/node-canvas/binding.gyp"

# Backup the original binding.gyp file
cp "$BINDING_GYP_PATH" "${BINDING_GYP_PATH}.bak"

# Check if the file already contains the android_ndk_path variable
if grep -q "android_ndk_path" "$BINDING_GYP_PATH"; then
  echo "android_ndk_path variable already exists in the binding.gyp file."
else
  # Insert the android_ndk_path variable at the beginning of the file
  sed -i "1s/^/{\n  'variables': {\n    'android_ndk_path': '$ANDROID_NDK_PATH'\n  },\n/" "$BINDING_GYP_PATH"
fi

echo "binding.gyp file updated successfully."
