# Please pay attention to naming pattern

# move vRLCM VM
$vrlcmVM = "xint-vrslcm01"
$vrslcmFolderName = "xint-m01-fd-vrslcm"
$location = Get-Inventory -Name $vrslcmFolderName
Move-VM -VM (get-vm $vrlcmVM) -Destination $location

# move Aria Automation vms
$vravm = "xint-vra0*a"
$vraFolderName = "xint-m01-fd-vra"
$location = Get-Inventory -Name $vraFolderName
Move-VM -VM (get-vm $vravm) -Destination $location

# move Aria operations vms
$vropsFolderName = "xint-m01-fd-vrops"
$vropsvms = "xint-vrops0*a"
$location = Get-Inventory -Name $vropsFolderName
Move-VM -vm (get-vm $vropsvms) -Destination $location

# move Workspace One VMs
$wsaFolderName = "xint-m01-fd-wsa"
$WSOnevms = "xint-wsa0*a"
$location = Get-Inventory -Name $wsaFolderName
Move-VM -vm (get-vm $WSOnevms) -Destination $location