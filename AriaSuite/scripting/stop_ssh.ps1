# stop ssh service on all host in a connected vCenter
Get-VMHostService -VMHost (Get-VMHost) | Where-Object { $_.key -eq "TSM-SSH" } | Stop-VMHostService

# start the ssh service on all hosts
Get-VMHostService -VMHost (Get-VMHost) | Where-Object { $_.key -eq "TSM-SSH" } | start-VMHostService


#setup NTP Server
$NtpServer = 192.168.1.254
get-vmhost | Add-VMHostNtpServer -NtpServer $NtpServer