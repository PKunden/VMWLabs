$sddcManagerFqdn = "sfo-vcf01.sfo.rainpole.io"
$sddcManagerUser = "administrator@vsphere.local"
$sddcManagerPass = "VMw@re1!"
$domainFqdn = "sfo.rainpole.io"
$domainBindUser = "svc-vsphere-ad"
$domainBindPass = "VMw@re1!"
$vcenterAdminGroup = "gg-vc-admins"
$vcenterReadOnlyGroup = "gg-vc-read-only"

Add-vCenterGlobalPermission -server $sddcManagerFqdn -user $sddcManagerUser -pass $sddcManagerPass -domain $domainFqdn -domainBindUser $domainBindUser -domainBindPass $domainBindPass -principal $vcenterAdminGroup -role Admin -propagate true -type group

Add-vCenterGlobalPermission -server $sddcManagerFqdn -user $sddcManagerUser -pass $sddcManagerPass -domain $domainFqdn -domainBindUser $domainBindUser -domainBindPass $domainBindPass  -principal $vcenterReadOnlyGroup -role ReadOnly -propagate true -type group
