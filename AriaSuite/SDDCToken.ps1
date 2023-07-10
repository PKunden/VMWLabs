###### fixed for all scripts #############
$domainname = ".corp.local"
$sddcmHostName = "sfo-vcf01"
$sddcDomainName = "sfo-m01"
$sddcManagerUser = "administrator@vsphere.local"
$sddcManagerPass = "PSGlobalCloud123!"
$domainFqdn = "vsphere.local"
$vCenterName = "sfo-m01-vc01.corp.local"
$sddcManagerFqdn = "$sddcmHostName$domainname" # concatenate string



Request-VCFToken -fqdn $sddcManagerFqdn -username $sddcManagerUser -password $sddcManagerPass