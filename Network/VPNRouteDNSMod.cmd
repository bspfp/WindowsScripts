@ECHO OFF

:: ���� �����⿡�� ���� ���� 192.168.0.0/24 ��Ʈ��ũ ȯ���� �������� �ۼ�
:: 192.168.0.0�� ���� ����� ���� ����
:: 192.168.0.0/24�� ���� ����� ���� �߰�, 192.168.0.1�� ����Ʈ���̷� ��
ROUTE DELETE 192.168.0.0
ROUTE ADD 192.168.0.0 MASK 255.255.255.0 192.168.0.1 METRIC 1

:: Wi-Fi ������ DNS ������ Google Public DNS�� ����
powershell.exe -Command "& {Set-DnsClientServerAddress -InterfaceAlias ("""Wi-Fi""") -ServerAddresses ("""8.8.8.8""", """8.8.4.4""")}"