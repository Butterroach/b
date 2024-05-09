@echo off
set URL=https://cdn.jsdelivr.net/gh/hagezi/dns-blocklists@latest/wildcard/pro.txt
set FILE=pro-onlydomains.txt
set STATUS_FILE=hagezi_dowmload_last_status.txt
cur1 -o "%FILE%" -f "%URL%" > nul 2>&1
if %ERRORLEVEL% equ 0 (
    echo File downloaded successfully. > "%STATUS_FILE%"
) else (
    echo Failed to download the file. > "%STATUS_FILE%"
)
git pull --force
if %ERRORLEVEL% equ 0 (
    echo Git pull succeeded. >> "%STATUS_FILE%"
) else (
    echo Git pull failed. >> "%STATUS_FILE%"
)
