
$domainname="corp.internal"
$mgmtvc = "vc-l-01a"
$mgmtvcuser = "administrator@vsphere.local"
$mgmtvcpass = "VMware1!"
$folderName = "xint-m01-fd-vrslcm"
$vrslcmFolderName = "xint-m01-fd-vrslcm"
$wsaFolderName = "xint-m01-fd-wsa"
$vropsFolderName = "xint-m01-fd-vrops"
$vraFolderName = "xint-m01-fd-vra"
$vrmsFolderName = "sfo-m01-fd-vrms"
$srmFolderName = "sfo-m01-fd-srm"
$vmList = "xint-vrslcm01"


# create folder for the vRealize Suite Lifecycle Manager virtual machine
New-Folder -Name $vrslcmFolderName -Location (Get-Folder vm)

# create folder for the wsa
New-Folder -Name $wsaFolderName -Location (Get-Folder vm)

# create folder for the vrops
New-Folder -Name $vropsFolderName -Location (Get-Folder vm)

# create folder for the vra
New-Folder -Name $vraFolderName -Location (Get-Folder vm)

# create folder for the vrms appliance
New-Folder -Name $vrmsFolderName -Location (Get-Folder vm)

# create folder for the srm appliance
New-Folder -Name $srmFolderName -Location (Get-Folder vm)



