@ECHO OFF

:: 탐색기 종료
:: IconCache.db 파일 속성 변경
:: IconCache.db 파일 삭제
:: 탐색기 시작

taskkill /F /IM explorer.exe && ^
ATTRIB %USERPROFILE%\AppData\Local\IconCache.db -S -R -H && ^
DEL /Q %USERPROFILE%\AppData\local\IconCache.db && ^
START explorer.exe && ^
EXIT /B 0

PAUSE
EXIT /B 1
