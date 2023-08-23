$sddcm = "sddc-md-vcf0-ko.rainpole.dev"
$adminuser = "administrator@vsphere.local"
$password = "PSGlobalCloud123!"
Request-VCFToken -fqdn $sddcm -username $adminuser -password $password