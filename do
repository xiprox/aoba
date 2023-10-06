#!/bin/sh

# Runs code generation. Use: "./gen" or "./gen watch" in project dir.
if [[ $1 == "gen" ]]; then
    if [[ $2 == "watch" ]]; then
        fvm flutter pub run build_runner watch --delete-conflicting-outputs
    else
        fvm flutter pub run build_runner build --delete-conflicting-outputs
    fi
fi
