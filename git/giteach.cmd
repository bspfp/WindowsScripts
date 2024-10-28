@ECHO OFF

pwsh -ExecutionPolicy Bypass -Command "& {Get-ChildItem . -Directory | ForEach-Object { Set-Location $_.FullName; echo $_.FullName; git %* }}"
