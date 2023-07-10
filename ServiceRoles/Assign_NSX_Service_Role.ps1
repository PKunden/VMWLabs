# Define a Custom Role in vSphere for the NSX Service Accounts for Identity and Access Management for VMware Cloud Foundation

###### fixed for all scripts #############
$domainname = ".corp.local"
$sddcmHostName = "sddc-md-vcf0-ko"
$sddcDomainName = "md-vcf0-ko"
$sddcManagerUser = "administrator@vsphere.local"
$sddcManagerPass = "PSGlobalCloud123!"
$SSOdomainFQDN = "vsphere.local"
$vCenterName = "vc-md-vcf0-ko"
$sddcManagerFqdn = "$sddcmHostName$domainname" # concatenate string
$vsphereRoleName = "NSX-vSphereIntegration"
###### fixed for all scripts #############

Add-vSphereRole -server $sddcManagerFqdn -user $sddcManagerUser -pass $sddcManagerPass -sddcDomain $sddcDomainName -roleName $vsphereRoleName

# lets connect to vCenter sso and pull the service account which has nsx 
Connect-SsoAdminServer -Server $vCenterName -User $sddcManagerUser -Password $sddcManagerPass
$allNSXSVCAccounts = Get-SsoPersonUser -Name *nsx* -Domain vsphere.local

# add all NSX accounts to LicenseService.Administrators groups
foreach ($account in $allNSXSVCAccounts) {
    Add-SsoPermission -server $sddcManagerFqdn -user $sddcManagerUser -pass $sddcManagerPass -sddcDomain $sddcDomainName -domain $SSOdomainFQDN `
        -principal $account.name -ssoGroup "LicenseService.Administrators" -type user -source local
}


Add-SsoPermission -server $sddcManagerFqdn -user $sddcManagerUser -pass $sddcManagerPass `
    -sddcDomain $sddcDomainName -domain $SSOdomainFQDN -principal $serviceAccount -ssoGroup "LicenseService.Administrators" -type user -source local

$domainBindUser = "administrator@vsphere.local" # need to check later what username password should be here
$domainBindPass = "PSGlobalCloud123!"
$mgmtSddcDomainName = "sfo-m01"
$mgmtServiceAccount = "svc-sfo-m01-nsx01-sfo-m01-vc01"
$wld1SddcDomainName = "sfo-w01"
$wld2SddcDomainName = "sfo-w02"
# $wld1ServiceAccount = "svc-sfo-w01-nsx01-sfo-w01-vc01"
# $wld2ServiceAccount = "svc-sfo-w02-nsx01-sfo-w02-vc01"

$wld1ServiceAccount = "svc", $wld1nsx, $wld1vc -join "-"
$wld2ServiceAccount = "svc", $wld2nsx, $wld2vc -join "-"

# Request-VCFToken -fqdn $sddcManagerFqdn -username $sddcManagerUser -password $sddcManagerPass
$alldomains = Get-VCFWorkloadDomain

foreach ($domain in $alldomains) {
    if ($domain.name -eq $mgmtSddcDomainName) {
        Add-vCenterGlobalPermission -server $sddcManagerFqdn -user $sddcManagerUser -pass $sddcManagerPass -sddcDomain $mgmtSddcDomainName -domain vsphere.local `
            -domainBindUser $domainBindUser -domainBindPass $domainBindPass -principal $mgmtServiceAccount -role $cvRole -propagate true -type user -localdomain
        # Sets service account from the workload domain to No Access role to the management domain.
        Set-vCenterPermission -server $sddcManagerFqdn -user $sddcManagerUser -pass $sddcManagerPass -domain vsphere.local `
            -workloadDomain $mgmtSddcDomainName  -principal $wld1ServiceAccount -role "NoAccess"
        Set-vCenterPermission -server $sddcManagerFqdn -user $sddcManagerUser -pass $sddcManagerPass -domain vsphere.local `
            -workloadDomain $mgmtSddcDomainName  -principal $wld2ServiceAccount -role "NoAccess"
    }

    if ($domain.name -eq $wld1SddcDomainName) {
        Add-vCenterGlobalPermission -server $sddcManagerFqdn -user $sddcManagerUser -pass $sddcManagerPass -sddcDomain $wld1SddcDomainName -domain vsphere.local `
            -domainBindUser $domainBindUser -domainBindPass $domainBindPass -principal $wld1ServiceAccount -role $cvRole -propagate true -type user -localdomain
        # Sets service account from the management domain to No Access role to the workload domain.
        Set-vCenterPermission -server $sddcManagerFqdn -user $sddcManagerUser -pass $sddcManagerPass -domain vsphere.local `
            -workloadDomain $wld1SddcDomainName  -principal  $mgmtServiceAccount -role "NoAccess"
        # Sets service account from the workload domain 2 to No Access role to the workload1 domain.
        Set-vCenterPermission -server $sddcManagerFqdn -user $sddcManagerUser -pass $sddcManagerPass -domain vsphere.local `
            -workloadDomain $wld1SddcDomainName  -principal  $wld2ServiceAccount -role "NoAccess"

    }
    if ($domain.name -eq $wld2SddcDomainName) {

        Add-vCenterGlobalPermission -server $sddcManagerFqdn -user $sddcManagerUser -pass $sddcManagerPass -sddcdomain $wld2SddcDomainName -domain vsphere.local `
            -domainBindUser $domainBindUser -domainBindPass $domainBindPass -principal $wld2ServiceAccount -role $cvRole -propagate true -type user -localdomain
        # Sets service account from the management domain to No Access role to the workload domain.
        Set-vCenterPermission -server $sddcManagerFqdn -user $sddcManagerUser -pass $sddcManagerPass -domain vsphere.local `
            -workloadDomain $wld2SddcDomainName  -principal  $mgmtServiceAccount -role "NoAccess"
        # Sets service account from the workload domain 1 to No Access role to the workload2 domain.
        Set-vCenterPermission -server $sddcManagerFqdn -user $sddcManagerUser -pass $sddcManagerPass -domain vsphere.local `
            -workloadDomain $wld2SddcDomainName  -principal  $wld1ServiceAccount -role "NoAccess"
    }
}

#### below lines might not be required #####
#$svcAcctName = "svc-nsxmgr"
#$serviceAccount = $svcAcctName, $sddcDomainName, $vCenterName -join "-" # concatenate string
# Reconfigure the vSphere Role and Permissions Scope for NSX Service Accounts for Identity and Access Management for VMware Cloud Foundation
