# Lessons learnt in commissions host in VCF

1. Always check if the certificate has been replaced with the name change.
2. Best way to check this is using the following command from Hatchery
   1. `openssl s_client -connect hostname:443 | openssl x509`

