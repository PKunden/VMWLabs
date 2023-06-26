
sshpass -p 'VMware1!' ssh root@172.16.11.102 '/sbin/generate-certificates'

# check syslogs first
sshpass -p 'VMware1!' ssh -o StrictHostKeyChecking=no root@172.16.11.101 'grep "Generating SSL" /var/log/syslog.log'
sshpass -p 'VMware1!' ssh -o StrictHostKeyChecking=no root@172.16.11.102 'grep "Generating SSL" /var/log/syslog.log'
sshpass -p 'VMware1!' ssh -o StrictHostKeyChecking=no root@172.16.11.103 'grep "Generating SSL" /var/log/syslog.log'
sshpass -p 'VMware1!' ssh -o StrictHostKeyChecking=no root@172.16.11.104 'grep "Generating SSL" /var/log/syslog.log'

# generate certificates
sshpass -p 'VMware1!' ssh -o StrictHostKeyChecking=no root@172.16.11.101 '/sbin/generate-certificates'
sshpass -p 'VMware1!' ssh -o StrictHostKeyChecking=no root@172.16.11.102 '/sbin/generate-certificates'
sshpass -p 'VMware1!' ssh -o StrictHostKeyChecking=no root@172.16.11.103 '/sbin/generate-certificates'
sshpass -p 'VMware1!' ssh -o StrictHostKeyChecking=no root@172.16.11.104 '/sbin/generate-certificates'

# restart the hostd and vpxa services
sshpass -p 'VMware1!' ssh -o StrictHostKeyChecking=no root@172.16.11.101 '/etc/init.d/hostd restart && /etc/init.d/vpxa restart'
sshpass -p 'VMware1!' ssh -o StrictHostKeyChecking=no root@172.16.11.102 '/etc/init.d/hostd restart && /etc/init.d/vpxa restart'
sshpass -p 'VMware1!' ssh -o StrictHostKeyChecking=no root@172.16.11.103 '/etc/init.d/hostd restart && /etc/init.d/vpxa restart'
sshpass -p 'VMware1!' ssh -o StrictHostKeyChecking=no root@172.16.11.104 '/etc/init.d/hostd restart && /etc/init.d/vpxa restart'