# This scripts add a credential to vi credential store.
# highly recommended for lab configuration and first time usage.
Set-PowerCLIConfiguration -Scope User -ParticipateInCEIP $true -confirm:$false
$ADDomain = "corp.local" # change this one
$VCENTERHOSTNAME = "vc01" # change this one
$VCFQDN = $VCENTERHOSTNAME + '.' + $ADDomain
$ADMINUSER = "administrator@vsphere.local" # almost never changes in lab
$ADMINPASS = "PSGlobalCloud123!" # change this one

############################ DO NOT CHANGE ANYTHING AFTER THIS ######################################
New-VICredentialStoreItem -Host $VCFQDN -User $ADMINUSER  -Password $ADMINPASS
# use -force for self signed certificate
Connect-VIServer $VCFQDN -Force