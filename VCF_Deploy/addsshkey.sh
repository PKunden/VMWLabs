# this scripts scans the publickey available on the destination hosts and add it under known_hosts
# destination e.g. could be nsxmgr, vCenter, backup server

# NSX Manager in Management Domain - RSA keys for VCF user
ssh-keyscan -4 -t rsa nsxmgr1-md-vcf0-ko.rainpole.dev >>/home/vcf/.ssh/known_hosts
ssh-keyscan -4 -t rsa 172.16.11.66 >>/home/vcf/.ssh/known_hosts

# NSX Manager in Management Domain - RSA Keys for commonsvc
ssh-keyscan -4 -t rsa nsxmgr1-md-vcf0-ko.rainpole.dev >>/etc/vmware/vcf/commonsvcs/known_hosts
ssh-keyscan -4 -t rsa 172.16.11.66 >>/etc/vmware/vcf/commonsvcs/known_hosts

# NSX Manager in Workload Domain - RSA Keys for commonsvc
ssh-keyscan -4 -t rsa nsxmgr1-wld1-vcf0-ko.rainpole.dev >>/etc/vmware/vcf/commonsvcs/known_hosts
ssh-keyscan -4 -t rsa 172.16.11.76 >>/etc/vmware/vcf/commonsvcs/known_hosts

# Backup Server
# ecdsa Keys for commonsvc
ssh-keyscan -4 -t ecdsa jet-play-99.rainpole.dev >>/etc/vmware/vcf/commonsvcs/known_hosts
ssh-keyscan -4 -t ecdsa 172.16.11.210 >>/etc/vmware/vcf/commonsvcs/known_hosts
# RSA Keys for commonsvc
ssh-keyscan -4 -t rsa 172.16.11.210 >>/etc/vmware/vcf/commonsvcs/known_hosts
ssh-keyscan -4 -t rsa jet-play-99.rainpole.dev >>/etc/vmware/vcf/commonsvcs/known_hosts
# ed25519 Keys for commonsvc
ssh-keyscan -4 -t ed25519 172.16.11.210 >>/etc/vmware/vcf/commonsvcs/known_hosts
ssh-keyscan -4 -t ed25519 rsa jet-play-99.rainpole.dev >>/etc/vmware/vcf/commonsvcs/known_hosts

# RSA Keys for VCF User
ssh-keyscan -4 -t ecdsa jet-play-99.rainpole.dev >>/home/vcf/.ssh/known_hosts
ssh-keyscan -4 -t ecdsa 172.16.11.210 >>/home/vcf/.ssh/known_hosts

# Edges - RSA Keys for VCF user
ssh-keyscan -4 -t rsa sfo-m01-edge01.rainpole.dev >>/home/vcf/.ssh/known_hosts
ssh-keyscan -4 -t rsa sfo-m01-edge02.rainpole.dev >>/home/vcf/.ssh/known_hosts
ssh-keyscan -4 -t rsa sfo-m01-edge03.rainpole.dev >>/home/vcf/.ssh/known_hosts
ssh-keyscan -4 -t rsa sfo-m01-edge04.rainpole.dev >>/home/vcf/.ssh/known_hosts

# Edges IP - RSA Keys for VCF
ssh-keyscan -4 -t rsa 172.16.11.69 >>/home/vcf/.ssh/known_hosts
ssh-keyscan -4 -t rsa 172.16.11.70 >>/home/vcf/.ssh/known_hosts
ssh-keyscan -4 -t rsa 172.16.11.71 >>/home/vcf/.ssh/known_hosts
ssh-keyscan -4 -t rsa 172.16.11.72 >>/home/vcf/.ssh/known_hosts

# Check the keys
cat /home/vcf/.ssh/known_hosts

# Edges - RSA Keys for commonsvc in /etc/vmware/vcf/commonsvcs/known_hosts
ssh-keyscan -4 -t rsa sfo-m01-edge01.rainpole.dev >>/etc/vmware/vcf/commonsvcs/known_hosts
ssh-keyscan -4 -t rsa sfo-m01-edge02.rainpole.dev >>/etc/vmware/vcf/commonsvcs/known_hosts
ssh-keyscan -4 -t rsa sfo-m01-edge03.rainpole.dev >>/etc/vmware/vcf/commonsvcs/known_hosts
ssh-keyscan -4 -t rsa sfo-m01-edge04.rainpole.dev >>/etc/vmware/vcf/commonsvcs/known_hosts

# Edges IP - RSA Keys for commonsvc in /etc/vmware/vcf/commonsvcs/known_hosts
ssh-keyscan -4 -t rsa 172.16.11.69 >>/etc/vmware/vcf/commonsvcs/known_hosts
ssh-keyscan -4 -t rsa 172.16.11.70 >>/etc/vmware/vcf/commonsvcs/known_hosts
ssh-keyscan -4 -t rsa 172.16.11.71 >>/etc/vmware/vcf/commonsvcs/known_hosts
ssh-keyscan -4 -t rsa 172.16.11.72 >>/etc/vmware/vcf/commonsvcs/known_hosts

# check if the keys have been added.
cat /etc/vmware/vcf/commonsvcs/known_hosts
