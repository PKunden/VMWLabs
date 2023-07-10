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

$nsxEnterpriseAdminGroup = "gg-nsx-enterprise-admins"
$nsxNetworkEngineerGroup = "gg-nsx-network-admins"
$nsxAuditorGroup = "gg-nsx-auditors"

# we need to use domain as variable e.g. DC=$variable1,DC=$variable2


New-ADGroup -Name $vcenterReadOnlyGroup -GroupScope Global -Path "OU=Security Groups,DC=corp,DC=local" -GroupCategory "Security"
New-ADGroup -Name $vcenterAdminGroup -GroupScope Global -Path "OU=Security Groups,DC=corp,DC=local" -GroupCategory "Security"
New-ADGroup -Name $ssogroup -GroupScope Global -Path "OU=Security Groups,DC=corp,DC=local" -GroupCategory "Security"

# VCF Users
New-ADGroup -Name $vcfAdminGroup -GroupScope Global -Path "OU=Security Groups,DC=corp,DC=local" -GroupCategory "Security"
New-ADGroup -Name $vcfOperatorGroup -GroupScope Global -Path "OU=Security Groups,DC=corp,DC=local" -GroupCategory "Security"
New-ADGroup -Name $vcfViewerGroup -GroupScope Global -Path "OU=Security Groups,DC=corp,DC=local" -GroupCategory "Security"
# WSOne Users
New-ADGroup -Name $wsaSuperAdminGroup -GroupScope Global -Path "OU=Security Groups,DC=corp,DC=local" -GroupCategory "Security"
New-ADGroup -Name $wsaDirAdminGroup -GroupScope Global -Path "OU=Security Groups,DC=corp,DC=local" -GroupCategory "Security"
New-ADGroup -Name $wsaReadOnlyGroup -GroupScope Global -Path "OU=Security Groups,DC=corp,DC=local" -GroupCategory "Security"
# VRCLI Users
New-ADGroup -Name $vrliAdminGroup -GroupScope Global -Path "OU=Security Groups,DC=corp,DC=local" -GroupCategory "Security"
New-ADGroup -Name $vrliUserGroup -GroupScope Global -Path "OU=Security Groups,DC=corp,DC=local" -GroupCategory "Security"
New-ADGroup -Name $vrliViewerGroup -GroupScope Global -Path "OU=Security Groups,DC=corp,DC=local" -GroupCategory "Security"

# Group for NSX

New-ADGroup -Name $nsxEnterpriseAdminGroup -GroupScope Global -Path "OU=Security Groups,DC=corp,DC=local" -GroupCategory "Security" -Description "NSX Enterprise Admin Users" -ManagedBy ((Get-ADUser -Identity draco)) 
New-ADGroup -Name $nsxNetworkEngineerGroup -GroupScope Global -Path "OU=Security Groups,DC=corp,DC=local" -GroupCategory "Security" -Description "NSX Network Engineer Users"
New-ADGroup -Name $nsxAuditorGroup -GroupScope Global -Path "OU=Security Groups,DC=corp,DC=local" -GroupCategory "Security" -Description "NSX Auditors users"
