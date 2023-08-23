$vmname = "web11-blue"
$ip = "172.16.50.11"
$vmlocation = "Linux"
$datastorename = "cl1-md-vcf0-ko-vsan01"
$specname = "ubuntu"
$subnetmask = "255.255.255.0"
$gateway = "172.16.50.253"
$vmhostname = "esxi1-cl1-md-vcf0-ko.rainpole.dev"
$templatename = "master_ubuntu"
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
$vm = get-vm $vmname
$tools = $vm.ExtensionData.Guest.ToolsRunningStatus
do {
    write-host "waiting for the VM Tools service to start"
    Start-Sleep -Seconds 1
    $vm = get-vm $vmname
    $tools = $vm.ExtensionData.Guest.ToolsRunningStatus
    
} 
while ($tools -eq "guestToolsRunning")

write-host "VMware tools status $($tools)"
    
do {
    
    write-host "Now waiting for the IP"
    Start-Sleep -Seconds 1
    $vm = get-vm $vmname
    $ipallocated = $vm.ExtensionData.Guest.IpAddress
}
while ($null -ne $ipallocated)


if ($ipallocated -match $ip) {
    write-host "IP Address is matching"
}
