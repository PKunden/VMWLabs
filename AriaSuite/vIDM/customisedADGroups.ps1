
$vcenterAdminGroup = "gg-vc-admins"
$vcenterReadOnlyGroup = "gg-vc-read-only"
$ssogroup = "gg-sso-admins"
$vcfAdminGroup = "gg-vcf-admins"
$vcfOperatorGroup = "gg-vcf-operators"
$vcfViewerGroup = "gg-vcf-viewers"
$wsaSuperAdminGroup = "gg-wsa-admins"
$wsaDirAdminGroup = "gg-wsa-directory-admins"
$wsaReadOnlyGroup = "gg-wsa-read-only"

$vrliAdminGroup = "gg-vrli-admins"
$vrliUserGroup = "gg-vrli-users"
$vrliViewerGroup = "gg-vrli-viewers"


Get-ADGroup -Identity $vrliAdminGroup | Set-ADGroup -Description "vRCLI Admins" -ManagedBy (Get-ADUser -Identity ron)
# Get-ADGroup -Identity  | Set-ADGroup -Description "vROPS Admins" -ManagedBy (Get-ADUser -Identity Neville)
Get-ADGroup -Identity $wsaSuperAdminGroup | Set-ADGroup -Description "WSOne Admins" -ManagedBy (Get-ADUser -Identity harry)
