#!/bin/bash

# Runs code generation. Use: "./do gen" or "./do gen watch" in project dir.
if [[ $1 == "gen" ]]; then
    if [[ $2 == "watch" ]]; then
        fvm flutter pub run build_runner watch --delete-conflicting-outputs
    else
        fvm flutter pub run build_runner build --delete-conflicting-outputs
    fi
fi

# Read the project Flutter version from .fvm/fvm_config.json and output the version only (e.g. 3.13.8).
if [[ $1 == "get-flutter-version" ]]; then
    grep -E -o '"flutterSdkVersion": "[^"]+"' .fvm/fvm_config.json | awk -F'"' '{print $4}'
fi
