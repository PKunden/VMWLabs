$domainname = ".corp.local"
$sddcmHostName = "sddc-md-vcf0-ko"
$sddcDomainName = "md-vcf0-ko"
$sddcManagerUser = "administrator@vsphere.local"
$sddcManagerPass = "PSGlobalCloud123!"
$sddcManagerFqdn = "$sddcmHostName$domainname" # concatenate string
$emailAddress = "administrator@corp.local"
$vrslcmVmName = "vrslcm1-md-vcf0-ko"
$datacenterName = "cl1-md-vcf0-ko-dc01"

# won't unless you have deployed vcf aware VRLCM

Add-vRLIAlertVirtualMachine -server $sddcManagerFqdn -user $sddcManagerUser -pass $sddcManagerPass `
    -sddcDomainName $sddcDomainName -vmName $vrslcmVmName -email $emailAddress -alertTemplate ".\SampleNotifications\vrli-vcf-vmVrslcm.json" -vropsIntegration

Add-vRLIAlertDatacenter -server $sddcManagerFqdn -user $sddcManagerUser -pass $sddcManagerPass `
    -sddcDomainName $sddcDomainName -datacenterName $datacenterName -email $emailAddress -alertTemplate ".\SampleNotifications\vrli-vcf-datacenter.json" -vropsIntegration