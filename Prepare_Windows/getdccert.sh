openssl.exe s_client nexus.corp.local:636
# from linux try below command
openssl s_client -connect nexus.corp.local:636 | openssl x509

# Inputs for SSO
ldaps://nexus.corp.local:636
