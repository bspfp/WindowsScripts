@ECHO OFF

:: 보통 공유기에서 많이 쓰는 192.168.0.0/24 네트워크 환경을 기준으로 작성
:: 192.168.0.0에 대한 라우팅 정보 삭제
:: 192.168.0.0/24에 대한 라우팅 정보 추가, 192.168.0.1을 게이트웨이로 함
ROUTE DELETE 192.168.0.0
ROUTE ADD 192.168.0.0 MASK 255.255.255.0 192.168.0.1 METRIC 1

:: Wi-Fi 연결의 DNS 설정을 Google Public DNS로 변경
powershell.exe -Command "& {Set-DnsClientServerAddress -InterfaceAlias ("""Wi-Fi""") -ServerAddresses ("""8.8.8.8""", """8.8.4.4""")}"