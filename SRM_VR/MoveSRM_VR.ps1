# move vrms vm
$vrmsvm = "vrms-01a"
$location=Get-Inventory -Name $vrmsFolderName
Move-VM -VM $vrmsvm -Destination $location

# move srm vm
$srmvm= "srm-01a"
$location = Get-Inventory -Name $srmFolderName
Move-VM -vm $srmvm -Destination $location