
# get name of management domain
# $sddc | Select-String -Pattern 'cloud foundation management domain'
# get vRLI VMs
# $nameip | Select-String -Pattern "sfo-vrli01"

$domainname = ".corp.local"
$sddcmHostName = "sddc-md-vcf0-ko"
$sddcDomainName = "md-vcf0-ko"
$sddcManagerUser = "administrator@vsphere.local"
$sddcManagerPass = "PSGlobalCloud123!"

$ariaProduct = "vrli"
$arule = "affinity-rule" # either arule or aarule
$aarule = "anti-affinity-rule"
$VMGroup = "vm-group"

$vRLIVMs = "vrli1-md-vcf0-ko,vrli2-md-vcf0-ko,vrli3-md-vcf0-ko"
# $ruleName = "vm-vm-rule-wsa-vrli"
# $drsGroupNameWsa = "sfo-m01-vm-group-wsa"

$smtpServer = "smtp.corp.local"
$port = "25"
$emailsender = "administrator@corp.local"
$smtpUser = "svc-vrli-smtp"
$smtpPass = "VMware123!"

##################### do not modify anything after this #####################

$sddcManagerFqdn = "$sddcmHostName$domainname" # concatenate string
$antiAffinityRuleName = $sddcDomainName, $aarule, $ariaProduct -join "-" # concatenate string
$drsGroupNameVrli = $sddcDomainName, $VMGroup, $ariaProduct -join "-" # concatenate string


Add-AntiAffinityRule -server $sddcManagerFqdn -user $sddcManagerUser -pass $sddcManagerPass -domain $sddcDomainName -ruleName $antiAffinityRuleName -antiAffinityVMs $vRLIVMs

Add-ClusterGroup -server $sddcManagerFqdn -user $sddcManagerUser -pass $sddcManagerPass -domain $sddcDomainName -drsGroupName $drsGroupNameVrli -drsGroupVMs $vRLIVMs
# ensure WSOne Standalone is deployed
# to power on the standalone WSOne VM before the vRLI VMs.

# Add-VmStartupRule -server $sddcManagerFqdn -user $sddcManagerUser -pass $sddcManagerPass -domain $sddcDomainName -ruleName $ruleName -vmGroup $drsGroupNameVrli -dependOnVmGroup $drsGroupNameWsa

Add-vRLISmtpConfiguration -server $sddcManagerFqdn -user $sddcManagerUser -pass $sddcManagerPass -smtpServer $smtpServer -port $port -sender $emailsender -smtpUser $smtpUser -smtpPass $smtpPass
