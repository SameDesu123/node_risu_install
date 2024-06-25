#!/bin/bash

# android-ndk-r21d 다운로드 및 설치
pkg install wget unzip
cd $HOME
wget https://dl.google.com/android/repository/android-ndk-r21d-linux-x86_64.zip
unzip android-ndk-r21d-linux-x86_64.zip
export ANDROID_NDK_HOME=$HOME/android-ndk-r21d
export PATH=$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/linux-x86_64/bin:$PATH

# Path to the binding.gyp file relative to the current directory
BINDING_GYP_PATH="$PWD/node-canvas/binding.gyp"

# Check if the binding.gyp file exists
if [ ! -f "$BINDING_GYP_PATH" ]; then
  echo "binding.gyp file not found at $BINDING_GYP_PATH"
  exit 1
fi

# Backup the original binding.gyp file
cp "$BINDING_GYP_PATH" "${BINDING_GYP_PATH}.bak"

# Check if the file already contains the android_ndk_path variable
if grep -q "android_ndk_path" "$BINDING_GYP_PATH"; then
  echo "android_ndk_path variable already exists in the binding.gyp file."
else
  # Create a temporary file to hold the new content
  TMP_FILE=$(mktemp)

  # Insert the android_ndk_path variable at the beginning of the file
  {
    echo "{"
    echo "  'variables': {"
    echo "    'android_ndk_path': '$ANDROID_NDK_PATH'"
    echo "  },"
    # Read the original content, but skip the first character '{'
    tail -n +2 "$BINDING_GYP_PATH"
  } > "$TMP_FILE"
  
  # Replace the original file with the new file
  mv "$TMP_FILE" "$BINDING_GYP_PATH"
fi

echo "binding.gyp file updated successfully."
