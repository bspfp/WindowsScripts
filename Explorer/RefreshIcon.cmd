@ECHO OFF

:: Ž���� ����
:: IconCache.db ���� �Ӽ� ����
:: IconCache.db ���� ����
:: Ž���� ����

taskkill /F /IM explorer.exe && ^
ATTRIB %USERPROFILE%\AppData\Local\IconCache.db -S -R -H && ^
DEL /Q %USERPROFILE%\AppData\local\IconCache.db && ^
START explorer.exe && ^
EXIT /B 0

PAUSE
EXIT /B 1
