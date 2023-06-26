export hostname=esxi1-cl1-md-vcf0-ko
export domainname=.corp.local
export fqdn=$hostname$domainname
esxcli system hostname set --fqdn=esxi1-cl1-md-vcf0-ko.corp.local

sshpass -p 'VMware1!' ssh root@172.16.11.101 'esxcli system hostname set --fqdn=esxi1-cl1-md-vcf0-ko.corp.local'
sshpass -p 'VMware1!' ssh root@172.16.11.102 'esxcli system hostname set --fqdn=esxi2-cl1-md-vcf0-ko.corp.local'
sshpass -p 'VMware1!' ssh root@172.16.11.103 'esxcli system hostname set --fqdn=esxi3-cl1-md-vcf0-ko.corp.local'
sshpass -p 'VMware1!' ssh root@172.16.11.104 'esxcli system hostname set --fqdn=esxi4-cl1-md-vcf0-ko.corp.local'

# check the hostname is set as expected
sshpass -p 'VMware1!' ssh root@172.16.11.101 'esxcli system hostname get'
sshpass -p 'VMware1!' ssh root@172.16.11.102 'esxcli system hostname get'
sshpass -p 'VMware1!' ssh root@172.16.11.103 'esxcli system hostname get'
sshpass -p 'VMware1!' ssh root@172.16.11.104 'esxcli system hostname get'

# generate certificates
sshpass -p 'VMware1!' ssh -o StrictHostKeyChecking=no root@172.16.11.101 '/sbin/generate-certificates'
sshpass -p 'VMware1!' ssh -o StrictHostKeyChecking=no root@172.16.11.102 '/sbin/generate-certificates'
sshpass -p 'VMware1!' ssh -o StrictHostKeyChecking=no root@172.16.11.103 '/sbin/generate-certificates'
sshpass -p 'VMware1!' ssh -o StrictHostKeyChecking=no root@172.16.11.104 '/sbin/generate-certificates'

# restart esxi host
sshpass -p 'VMware1!' ssh -o StrictHostKeyChecking=no root@172.16.11.101 'reboot'
sshpass -p 'VMware1!' ssh -o StrictHostKeyChecking=no root@172.16.11.102 'reboot'
sshpass -p 'VMware1!' ssh -o StrictHostKeyChecking=no root@172.16.11.103 'reboot'
sshpass -p 'VMware1!' ssh -o StrictHostKeyChecking=no root@172.16.11.104 'reboot'