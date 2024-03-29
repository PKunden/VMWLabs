$vmname = "jet-db01-orange"
$ip = "172.16.11.201"
$subnetmask = "255.255.255.0"
$gateway = "172.16.151.253"
$vmlocation = "jetx_vms"
$datastorename = "cl1-md-vcf0-ko-vsan01"
$specname = "jetlinux"
$vmhostname = "esxi1-cl1-md-vcf0-ko.rainpole.dev"
$templatename = "masterubuntu"
$vsanpolicyName = "Policy-SFTT1"


$template = get-template -Name $templatename
$specs = Get-OSCustomizationSpec -Name $specname
$datastore = get-datastore -Name $datastorename
$vsansp = Get-SpbmStoragePolicy -Name $vsanpolicyName
$destination = Get-Folder -Name $vmlocation

Get-OSCustomizationSpec $specs | Get-OSCustomizationNicMapping | Set-OSCustomizationNicMapping -IpMode UseStaticIP -IpAddress $ip -SubnetMask $subnetmask -DefaultGateway $gateway
New-VM -Name $vmname -Template $template -Datastore $datastore -VMHost (get-vmhost $vmhostname) -OSCustomizationSpec $specs -Location $destination -StoragePolicy $vsansp
write-host "Waiting for 10 seconds"
Start-Sleep -Seconds 10
Get-VM $vmname | Get-NetworkAdapter | Set-NetworkAdapter -StartConnected $true -Confirm:$false -OutVariable $null
get-vm $vmname | Set-VM -MemoryGB 4 -Confirm:$false
start-vm $vmname -Confirm:$false -RunAsync -OutVariable $null
$vm = get-vm $vmname
$tools = $vm.ExtensionData.Guest.ToolsRunningStatus
do {
    write-host "waiting for the VM Tools service to start"
    Start-Sleep -Seconds 1
    $vm = get-vm $vmname
    $tools = $vm.ExtensionData.Guest.ToolsRunningStatus
    
} 
while ($tools -eq "guestToolsNotRunning")

write-host "VMware tools status $($tools)"
    
do {
    
    write-host "Now waiting for the IP"
    Start-Sleep -Seconds 1
    $vm = get-vm $vmname
    $ipallocated = $vm.ExtensionData.Guest.IpAddress
}
while ($null -eq $ipallocated)


if ($ipallocated -match $ip) {
    write-host "IP Address is matching"
}
