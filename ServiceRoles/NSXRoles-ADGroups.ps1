# Assign NSX Manager Roles to Active Directory Groups for Identity and Access Management for VMware Cloud Foundation
# NSXRoles-ADGroups

###### fixed for all scripts #############
$domainname = ".corp.local"
$sddcmHostName = "sfo-vcf01"
$sddcDomainName = "sfo-m01"
$sddcManagerUser = "administrator@vsphere.local"
$sddcManagerPass = "PSGlobalCloud123!"
$sddcManagerFqdn = "$sddcmHostName$domainname" # concatenate string

# $SSOdomainFQDN = "vsphere.local"
# $vCenterName = "sfo-m01-vc01"
# $vCenterFqdn = "$vCenterName$domainname" # concatenate string


$nsxEnterpriseAdminGroup = "gg-nsx-enterprise-admins@corp.local"
$nsxNetworkEngineerGroup = "gg-nsx-network-admins@corp.local"
$nsxAuditorGroup = "gg-nsx-auditors@corp.local"

Add-NsxtVidmRole -server $sddcManagerFqdn -user $sddcManagerUser -pass $sddcManagerPass -domain $sddcDomainName -type group -principal $nsxEnterpriseAdminGroup -role enterprise_admin
Add-NsxtVidmRole -server $sddcManagerFqdn -user $sddcManagerUser -pass $sddcManagerPass -domain $sddcDomainName -type group -principal $nsxNetworkEngineerGroup -role network_engineer
Add-NsxtVidmRole -server $sddcManagerFqdn -user $sddcManagerUser -pass $sddcManagerPass -domain $sddcDomainName -type group -principal $nsxAuditorGroup -role auditor
