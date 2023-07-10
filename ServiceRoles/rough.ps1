###### fixed for all scripts #############
$domainname = ".corp.local"
$sddcmHostName = "sfo-vcf0"
$sddcDomainName = "sfo-m01"
$sddcManagerUser = "administrator@vsphere.local"
$sddcManagerPass = "PSGlobalCloud123!"
$domainFqdn = "vsphere.local"
$vCenterName = "sfo-m01-vc01.corp.local"
$sddcManagerFqdn = "$sddcmHostName$domainname" # concatenate string

###### fixed for all scripts #############
Connect-SsoAdminServer -Server $vCenterName -User $sddcManagerUser -Password $sddcManagerPass
$allNSXSVCAccounts = Get-SsoPersonUser -Name *nsx* -Domain vsphere.local

foreach ($account in $allNSXSVCAccounts) {
    Add-SsoPermission -server $sddcManagerFqdn -user $sddcManagerUser -pass $sddcManagerPass -sddcDomain $sddcDomainName -domain $domainFqdn -principal $account.name -ssoGroup "LicenseService.Administrators" -type user -source local
}