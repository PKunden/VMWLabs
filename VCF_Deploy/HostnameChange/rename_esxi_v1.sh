export hostname=esxi1-cl1-md-vcf0-ko
export domainname=.rainpole.dev
export fqdn=$hostname$domainname
esxcli system hostname set --fqdn=esxi1-cl1-md-vcf0-ko.rainpole.dev

# log into Hatchery and run below commands.
sshpass -p 'VMware1!' ssh root@172.16.11.101 'esxcli system hostname set --fqdn=esxi1-cl1-md-vcf0-ko.rainpole.dev'
sshpass -p 'VMware1!' ssh root@172.16.11.102 'esxcli system hostname set --fqdn=esxi2-cl1-md-vcf0-ko.rainpole.dev'
sshpass -p 'VMware1!' ssh root@172.16.11.103 'esxcli system hostname set --fqdn=esxi3-cl1-md-vcf0-ko.rainpole.dev'
sshpass -p 'VMware1!' ssh root@172.16.11.104 'esxcli system hostname set --fqdn=esxi4-cl1-md-vcf0-ko.rainpole.dev'

# check the hostname is set as expected
sshpass -p 'VMware1!' ssh root@172.16.11.101 'esxcli system hostname get'
sshpass -p 'VMware1!' ssh root@172.16.11.102 'esxcli system hostname get'
sshpass -p 'VMware1!' ssh root@172.16.11.103 'esxcli system hostname get'
sshpass -p 'VMware1!' ssh root@172.16.11.104 'esxcli system hostname get'

# generate certificates
sshpass -p 'VMware1!' ssh root@172.16.11.101 '/sbin/generate-certificates'
sshpass -p 'VMware1!' ssh root@172.16.11.102 '/sbin/generate-certificates'
sshpass -p 'VMware1!' ssh root@172.16.11.103 '/sbin/generate-certificates'
sshpass -p 'VMware1!' ssh root@172.16.11.104 '/sbin/generate-certificates'

# restart esxi host
sshpass -p 'VMware1!' ssh root@172.16.11.101 'reboot'
sshpass -p 'VMware1!' ssh root@172.16.11.102 'reboot'
sshpass -p 'VMware1!' ssh root@172.16.11.103 'reboot'
sshpass -p 'VMware1!' ssh root@172.16.11.104 'reboot'

# in case you to shutdown esxi hosts in one go
sshpass -p 'VMware1!' ssh root@172.16.11.101 'esxcli system shutdown poweroff'
sshpass -p 'VMware1!' ssh root@172.16.11.102 'esxcli system shutdown poweroff'
sshpass -p 'VMware1!' ssh root@172.16.11.103 'esxcli system shutdown poweroff'
sshpass -p 'VMware1!' ssh root@172.16.11.104 'esxcli system shutdown poweroff'
