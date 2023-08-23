# connect to vCenter

$clustername = "cl1-md-vcf0-ko-cl01"
$vspherehaadv = @{} # hashtable created

$vspherehaadv = @{
    "das.ignoreInsufficientHbDatastore" = "true"          
    "das.ignoreRedundantNetWarning"     = "true"          
    "das.includeFTcomplianceChecks"     = "false"         
    "das.iostatsInterval"               = 0             
    "das.isolationaddress0"             = "172.16.13.253" # please change this as per your environment
    "das.respectVmVmAntiAffinityRules"  = "true"          
    "das.usedefaultisolationaddress"    = "false"         
}

foreach ($key in $vspherehaadv.Keys) {
    New-AdvancedSetting -Name $key -Value $vspherehaadv[$key] -Entity (get-cluster $clustername ) -Type ClusterHA -Confirm:$false
}