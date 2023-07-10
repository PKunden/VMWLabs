
$vmname = "xint-wsa03a"
$ip = "192.168.73.13"
$vmlocation = "AZ1-VMs"
$datastorename = "vsanDatastore"
$specname = "ubuntu"
$subnetmask = "255.255.255.0"
$gateway = "192.168.73.254"
$vmhostname = "esx-01a.corp.internal"
$templatename = "lu22-t"
$vsanpolicyName = "Policy-SFTT1"

$template = get-template -Name $templatename
$specs = Get-OSCustomizationSpec -Name $specname
$datastore = get-datastore -Name $datastorename
$vsansp = Get-SpbmStoragePolicy -Name $vsanpolicyName
Get-OSCustomizationSpec $specs | Get-OSCustomizationNicMapping | Set-OSCustomizationNicMapping -IpMode UseStaticIP -IpAddress $ip -SubnetMask $subnetmask -DefaultGateway $gateway
New-VM -Name $vmname -Template $template -Datastore $datastore -VMHost (get-vmhost $vmhostname) -OSCustomizationSpec $specs -Location (Get-Folder -Name $vmlocation) -StoragePolicy $vsansp
write-host "Waiting for 10 seconds"
Start-Sleep -Seconds 10
Get-VM $vmname | Get-NetworkAdapter | Set-NetworkAdapter -StartConnected $true -Confirm:$false -OutVariable $null
get-vm $vmname | Set-VM -MemoryGB 4 -Confirm:$false
start-vm $vmname -Confirm:$false -RunAsync -OutVariable $null

do {
    $vm = get-vm $vmname
    Start-Sleep -Seconds 20
    write-host "waiting for the VM Tools service to start"
} 
while ($vm.ExtensionData.Guest.ToolsRunningStatus -eq "guestToolsNotRunning")
$tool = Get-VM $vmname
$toolstatus = $vm.ExtensionData.Guest.ToolsRunningStatus

write-host "VMware tools status $($toolstatus)"
    
do {
    $vmtool = get-vm $vmname
    write-host "Now waiting for the IP"
    Start-Sleep -Seconds 20
}
while ($null -ne $vmtool.ExtensionData.Guest.IpAddress)

$tool = Get-VM $vmname



if ($tool.ExtensionData.Guest.IpAddress -match $ip) {
    write-host "IP Address is matching"
}