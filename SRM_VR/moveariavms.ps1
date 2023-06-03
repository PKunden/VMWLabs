# move Aria Automation vms
$vraFolderName = "xint-m01-fd-vra"

# Please pay attention to naming pattern
$vravm = "xint-vra0*a"
$location=Get-Inventory -Name $vraFolderName
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