esxcli system hostname set --fqdn esxi3-cl1-wld1-vcf0-ko.corp.local
/sbin/generate-certificates
# need sleep time
reboot

# ssl fingerprint
echo | openssl s_client -connect localhost:443 2>/dev/null | openssl x509 -noout -fingerprint -sha256

# ssh thumbprint
ssh-keygen -lf <(ssh-keyscan esxi3-cl1-wld1-vcf0-ko.corp.local 2>/dev/null)
