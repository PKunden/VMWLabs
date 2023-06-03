<#
This script provisions a Ubuntu VM based on the template configured and customised
Those parameters are listed under customization_steps.md
How to use this script
1. decide how many VMs you wish to deploy. Then change le value e.g. from 3 to your desired value
2. in this template, i'm deploying xint-vra01, xint-vra02 and xint-vra03 but different starting ip address
   This is achieved using $i+5 as seen below
#>

for($i=1; $i -le 3; $i++){
    Write-Host $i
$vmname = "xint-vra0$($i)a"
# you can as well customise ip starting range.
$ip = "192.168.73.2$($i+5)"
# just to check vm name and ip details
Write-Host $vmname 
write-host $ip
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
Get-OSCustomizationSpec $specs | Get-OSCustomizationNicMapping | Set-OSCustomizationNicMapping –IpMode UseStaticIP –IpAddress $ip –SubnetMask $subnetmask –DefaultGateway $gateway
New-VM -Name $vmname -Template $template -Datastore $datastore -VMHost (get-vmhost $vmhostname) -OSCustomizationSpec $specs -Location (Get-Folder -Name $vmlocation) -StoragePolicy $vsansp
write-host "Waiting for 10 seconds"
Start-Sleep -Seconds 10
# here you can change VM settings e.g. Portgroup, Memory and CPU
Get-VM $vmname | Get-NetworkAdapter | Set-NetworkAdapter -StartConnected $true -Confirm:$false -OutVariable $null
get-vm $vmname | Set-VM -MemoryGB 4 -Confirm:$false
Start-Sleep 10
start-vm $vmname -Confirm:$false -RunAsync -OutVariable $null
Start-Sleep 10
}