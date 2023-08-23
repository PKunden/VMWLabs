$vm = get-vm web12-blue 
$vm | Get-NetworkAdapter | Where-Object { $_.networkname -eq "cl1-md-vcf0-ko-vds01-pg-mgmt" } | set-networkadapter -Portgroup WebServices -Confirm:$false


