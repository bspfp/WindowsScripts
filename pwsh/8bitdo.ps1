# 장치 목록
Get-PnpDevice | `
    Where-Object { $_.InstanceId -like '*VID_2DC8*' -and $_.Status -ne 'Unknown' } | `
    ForEach-Object { Write-Host "[$($_.Status)] $($_.FriendlyName) - $($_.InstanceId)" }

# 비활성 장치 목록
Get-PnpDevice | `
    Where-Object { $_.InstanceId -like '*VID_2DC8*' -and $_.Status -eq 'Error' } | `
    ForEach-Object { Write-Host "$($_.InstanceId)" }

# 비활성화
Disable-PnpDevice -InstanceId 'HID\VID_2DC8&PID_310A&MI_01&COL02\8&2433DE32&0&0001' -Confirm:$false
Disable-PnpDevice -InstanceId 'USB\VID_2DC8&PID_310A&MI_02\7&74C1DA&4&0002' -Confirm:$false
Disable-PnpDevice -InstanceId 'USB\VID_2DC8&PID_310A&IG_00\8&25ABCDBD&0&00' -Confirm:$false

# 활성화
Enable-PnpDevice -InstanceId 'HID\VID_2DC8&PID_310A&MI_01&COL02\8&2433DE32&0&0001' -Confirm:$false
Enable-PnpDevice -InstanceId 'USB\VID_2DC8&PID_310A&MI_02\7&74C1DA&4&0002' -Confirm:$false
Enable-PnpDevice -InstanceId 'USB\VID_2DC8&PID_310A&IG_00\8&25ABCDBD&0&00' -Confirm:$false
