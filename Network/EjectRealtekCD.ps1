# D 드라이브부터 Z 드라이브까지 순회
foreach ($driveLetter in 'D'..'Z') {
    try {
        # 드라이브 경로 생성
        $drivePath = "$driveLetter`:"

        # 드라이브 정보 가져오기
        $driveInfo = Get-WmiObject -Query "SELECT * FROM Win32_Volume WHERE DriveLetter = '$drivePath'" -ErrorAction SilentlyContinue

        # 드라이브가 존재하고 이름이 Realtek인지 확인
        if ($driveInfo -and $driveInfo.Label -eq 'Realtek') {
            Write-Host "Realtek 디스크를 찾았습니다: $drivePath"
            
            # 디스크 꺼내기(Eject Media)
            $driveInfo | ForEach-Object { $_.Eject() }
            Write-Host "디스크를 꺼냈습니다: $drivePath"

            # 순회 종료
            break
        }
    }
    catch {
        # 에러 처리
        Write-Host "드라이브 $drivePath를 확인하는 중 에러가 발생했습니다."
    }
}
