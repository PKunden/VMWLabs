$baseGroupOU = "Security Groups"
$baseUserOU = "Security Users"
$ouLocation = "DC=rainpole,DC=dev"

$netSecGroupOU = "NetSec Groups"
$netSecUserOU = "NetSec Users"
$netSecOuLocation = "DC=rainpole,DC=dev"

$CloudAdminsGroupOU = "CloudAdmins Groups"
$CloudAdminsUserOU = "CloudAdmins Users"
$CloudAdminsOuLocation = "DC=rainpole,DC=dev"
#create a OU

# Network and Security OU
New-ADOrganizationalUnit -name $netSecGroupOU -Path $netSecOuLocation
New-ADOrganizationalUnit -name $netSecUserOU -Path $netSecOuLocation


# vSphere and VCF Admin OU
New-ADOrganizationalUnit -name $CloudAdminsGroupOU -Path $CloudAdminsOuLocation
New-ADOrganizationalUnit -name $CloudAdminsUserOU -Path $CloudAdminsOuLocation


# security OU
New-ADOrganizationalUnit -name $baseGroupOU -Path $ouLocation
New-ADOrganizationalUnit -name $baseUserOU -Path $ouLocation
