
$vmname = "ber-vidm-l-03a"
$ip = "192.168.75.52"
$vmlocation = "BA2-VMs"
$datastorename = "vsandatastore"
$specname = "ubuntu"
$subnetmask = "255.255.255.0"
$gateway = "192.168.75.254"
$vmhostname = "esx-155b.rainpole.dev"
$templatename = "template-ubuntu"
$vsanpolicyName = "Policy-PFTT1-SFTT1"



$template = get-template -Name $templatename
$specs = Get-OSCustomizationSpec -Name $specname
$datastore = get-datastore -Name $datastorename
$vsansp = Get-SpbmStoragePolicy -Name $vsanpolicyName
Get-OSCustomizationSpec $specs | Get-OSCustomizationNicMapping | Set-OSCustomizationNicMapping –IpMode UseStaticIP –IpAddress $ip –SubnetMask $subnetmask –DefaultGateway $gateway
New-VM -Name $vmname -Template $template -Datastore $datastore -VMHost (get-vmhost $vmhostname) -OSCustomizationSpec $specs -Location (Get-Folder -Name $vmlocation) -StoragePolicy $vsansp
write-host "Waiting for 10 seconds"
Start-Sleep -Seconds 10
Get-VM $vmname | Get-NetworkAdapter | Set-NetworkAdapter -StartConnected $true -Confirm:$false -OutVariable $null
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