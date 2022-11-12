@echo off

@REM Runs code generation. Use: "./run.bat gen" or "./run.bat gen watch" in project dir.
if "%1" == "gen" (
    if "%2" == "watch" (
        flutter pub run build_runner watch --delete-conflicting-outputs
    ) else (
        flutter pub run build_runner build --delete-conflicting-outputs
    )
)
