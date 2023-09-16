# disconnect vi servers
Disconnect-VIServer -Server * -Force
# connect to esxi host
connect-viserver esxi3-cl1-wld1-vcf0-ko.corp.local -force -User root -Password "VMware1!"
# start SSH Service
get-vmhost | Get-VMHostService | Where-Object { $_.key -eq "TSM-SSH" } | Start-VMHostService -Confirm:$false
# set policy to automatic
get-vmhost | Get-VMHostService | Where-Object { $_.key -eq "TSM-SSH" } | Set-VMHostService -Policy Automatic
