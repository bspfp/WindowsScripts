# WindowsScripts

Windows 사용하면서 가끔 사용하는 각종 스크립트 모음

- [WindowsScripts](#windowsscripts)
  - [탐색기](#탐색기)
    - [아이콘 캐싱 재설정](#아이콘-캐싱-재설정)
  - [네트워크](#네트워크)
    - [VPN 사용할 때 설정 변경](#vpn-사용할-때-설정-변경)
    - [Realtek USB Lan 꺼내기](#realtek-usb-lan-꺼내기)
  - [명령 프롬프트](#명령-프롬프트)
    - [파일 쓰기 시간 변경](#파일-쓰기-시간-변경)
  - [git](#git)
    - [특정 git 명령을 하위 폴더들에서 모두 수행](#특정-git-명령을-하위-폴더들에서-모두-수행)

## 탐색기

### 아이콘 캐싱 재설정

- [RefreshIcon.cmd](Explorer/RefreshIcon.cmd)
- 용도
  - 아이콘이 깨져서 보일 때
  - 엉뚱한 아이콘이 보일 때
  - 아이콘이 빈 문서 모양으로 표시 될 때
- 사용법
  1. 작업 중이던 것을 정리한다.(탐색기와 연동된 어플리케이션이 존재할 수 있으므로)
  1. RefreshIcon.cmd 실행
  1. 잠시 기다리면 Windows GUI Shell인 탐색기가 다시 시작되면서 아이콘이 정상화 된다
- 주의점
  - 아이콘 캐싱을 모두 지우는 것이기 때문에 잠시 동안은 새로운 캐싱을 위해 컴퓨터의 성능이 저하된다
  - 따라서 이 방법을 스케쥴러에 넣거나 수시로 하는 것은 비추천

## 네트워크

### VPN 사용할 때 설정 변경

- [VPNRouteDNSMod.cmd](Network/VPNRouteDNSMod.cmd)
- 용도
  - VPN 네트워크가 사용하는 IP 대역이 아닌 대역의 설정이 변경된 경우
    - 예) VPN 네트워크가 172.16.0.0/12, 10.0.0.0/8 를 사용하는데<br />
      집 공유기 192.168.0.0/24 설정이 수정되어 개인 PC와 거실 PC가 통신이 되지 않는 문제가 발생함
  - VPN 연결로 DNS 설정이 변경되어 웹사이트 이용이 제한되는 경우
- 사용법
  1. 공유기의 LAN 네트워크가 사용하려는 VPN의 네트워크와 겹치지 않도록 수정
  1. VPNRouteDNSMod.cmd 파일의 네트워크와 인터페이스를 수정
  1. 관리자 권한으로 VPNRouteDNSMod.cmd 파일을 실행
- 참고
  - 현재 네트워크 인터페이스에 설정된 DNS 정보 조회하는 PowerShell 명령<br />
    Get-DnsClientServerAddress
  - 파일의 내용은 아래 기준으로 작성됨
    - 공유기 네트워크: 192.168.0.0/24
    - VPN 네트워크: 172.16.0.0/12, 10.0.0.0/8
    - "Wi-Fi" 이름의 인터페이스로 인터넷과 연결
    - DNS는 Google Public DNS 사용
  - 이 수정에 의해 VPN 사용에 문제가 발생할 수 있음
    - VPN 환경에서 192.168.0.0 대역을 사용한다거나
    - VPN 환경에서 내부 DNS가 꼭 필요하다거나

### Realtek USB Lan 꺼내기
- [EjectRealtekCD](Network/EjectRealtekCD.ps1)
- 역시 안되네...
- 용도
  - Realtek 무선랜 + 블루투스 일부 모델이 PC에서 CDROM으로 잡히고 꺼내기를 해야 원래 용도로 동작하는 것이 있어서
- 참고
  - 원래 C++로 작성한 것이 있는데 파워쉘로도 될 거 같아서 AI에게 맡겨서 만든 스크립트
    - 지금 USB 무선랜 제품이 고장나서 테스트는 못해 봄
  - [C++ 버전](https://github.com/bspfp/EjectRealtekCD)

## 명령 프롬프트

### 파일 쓰기 시간 변경

- [touch.cmd](CommandPrompt/touch.cmd)
- 용도
  - Linux의 touch 명령과 유사한 동작
- 내용<br />
  `COPY /B filename.ext +,,`

## git

### 특정 git 명령을 하위 폴더들에서 모두 수행

- [giteach.cmd](git/giteach.cmd)
- 용도
  - 저장소에서 모조리 pull 하고 싶을 떄?