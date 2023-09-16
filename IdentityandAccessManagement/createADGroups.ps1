# vCenter
$vcenterAdminGroup = "gg-vc-admins"
$vcenterReadOnlyGroup = "gg-vc-read-only"
$ssogroup = "gg-sso-admins"
# VCF
$vcfAdminGroup = "gg-vcf-admins"
$vcfOperatorGroup = "gg-vcf-operators"
$vcfViewerGroup = "gg-vcf-viewers"
# WSONE
$wsaSuperAdminGroup = "gg-wsa-admins"
$wsaDirAdminGroup = "gg-wsa-directory-admins"
$wsaReadOnlyGroup = "gg-wsa-read-only"
# VRLI
$vrliAdminGroup = "gg-vrli-admins"
$vrliUserGroup = "gg-vrli-users"
$vrliViewerGroup = "gg-vrli-viewers"
# NSX
$nsxEntAdminGroup = "gg-nsx-enterprise-admins"
$nsxNetAdminGroup = "gg-nsx-network-admins"
$nsxAuditGroup = "gg-nsx-auditors"

# vCenter and VCF Goes into CloudAdmins OU
$CloudAdminsGroupOU = "CloudAdmins Groups"
$baseDN = ",DC=rainpole,DC=dev"
$CloudAdmingroupLocation = "OU=" + $CloudAdminsGroupOU + $baseDN

# vCenter Groups
New-ADGroup -Name $vcenterReadOnlyGroup -GroupScope Global -Path $CloudAdmingroupLocation -GroupCategory "Security" -Description "vCenter Read Only Privileges"
New-ADGroup -Name $vcenterAdminGroup -GroupScope Global -Path $CloudAdmingroupLocation -GroupCategory "Security" -Description "vCenter Administrators Privileges"
New-ADGroup -Name $ssogroup -GroupScope Global -Path $CloudAdmingroupLocation -GroupCategory "Security" -Description "vCenter SSO Administrators Privileges"

# VCF Users
New-ADGroup -Name $vcfAdminGroup -GroupScope Global -Path $groupLocation -GroupCategory "Security" -Description "VCF Administrators Group"
New-ADGroup -Name $vcfOperatorGroup -GroupScope Global -Path $groupLocation -GroupCategory "Security" -Description "VCF Operations Role"
New-ADGroup -Name $vcfViewerGroup -GroupScope Global -Path $groupLocation -GroupCategory "Security" -Description "VCF Viewer Privileges"

# NSX, WSOne and VRLI goes into single OU
$netSecGroupOU = "NetSec Groups"
$netSecGroupLocation = "OU=" + $netSecGroupOU + $baseDN

# NSX Groups
New-ADGroup -Name $nsxEntAdminGroup -GroupScope Global -Path $netSecGroupLocation -GroupCategory "Security" -Description "NSX Enterprise Administrator Privileges"
New-ADGroup -Name $nsxNetAdminGroup -GroupScope Global -Path $netSecGroupLocation -GroupCategory "Security" -Description "NSX Network Administrators Privilege"
New-ADGroup -Name $nsxAuditGroup -GroupScope Global -Path $netSecGroupLocation -GroupCategory "Security" -Description "NSX Audit Privileges"

# WSOne Users
New-ADGroup -Name $wsaSuperAdminGroup -GroupScope Global -Path $netSecGroupLocation -GroupCategory "Security" -Description "Workspace Super Admins Privileges"
New-ADGroup -Name $wsaDirAdminGroup -GroupScope Global -Path $netSecGroupLocation -GroupCategory "Security" -Description "Workspace Directory Admin Privileges"
New-ADGroup -Name $wsaReadOnlyGroup -GroupScope Global -Path $netSecGroupLocation -GroupCategory "Security" -Description "Workspace Read Only Privileges"

# VRCLI Users
New-ADGroup -Name $vrliAdminGroup -GroupScope Global -Path $netSecGroupLocation -GroupCategory "Security" -Description "VRLI Admin Privileges"
New-ADGroup -Name $vrliUserGroup -GroupScope Global -Path $netSecGroupLocation -GroupCategory "Security" -Description "VRLI User Privileges"
New-ADGroup -Name $vrliViewerGroup -GroupScope Global -Path $netSecGroupLocation -GroupCategory "Security" -Description "VRLI Viewer Privileges"