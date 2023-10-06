@echo off

@REM Runs code generation. Use: "./run.bat gen" or "./run.bat gen watch" in project dir.
if "%1" == "gen" (
    if "%2" == "watch" (
        fvm flutter pub run build_runner watch --delete-conflicting-outputs
    ) else (
        fvm flutter pub run build_runner build --delete-conflicting-outputs
    )
)
