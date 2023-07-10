# to start powervalidate solution you need a token. This script helps you achieve it
# just run this once and from the same powershell session run the other commands
###### fixed for all scripts #############
$domainname = "corp.local"
$sddcmHostName = "sfo-vcf01"
$sddcManagerUser = "administrator@vsphere.local"
$sddcManagerPass = "PSGlobalCloud123!"
$sddcManagerFqdn = $sddcmHostName + "." + $domainname # concatenate string

############################### do not modify anything after this ###########################
Request-VCFToken -fqdn $sddcManagerFqdn -username $sddcManagerUser -password $sddcManagerPass