@ECHO OFF
SETLOCAL ENABLEEXTENSIONS

IF "%~1"=="" GOTO NOARG

COPY /B %* +,, || EXIT /B 1
EXIT /B 0

:NOARG
ECHO touch.cmd target_file
EXIT /B 1
