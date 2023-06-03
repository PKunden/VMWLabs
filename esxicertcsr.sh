openssl req -new -nodes -out rui.csr -keyout rui-orig.key -config openssl.cfg
cat rui.csr
cat rui.key

$mspkiservername="dc-rpl01.rainpole.io"
$mspkicaname="rainpole-DC-RPL01-CA"
$cacertadminname="administrator@rainpole.io"
$cacertadminpasswd="VMw@re1!"
$certtemplate="WebServer"

Request-SignedCertificate -mscaComputerName $mspkiservername -mscaName $mspkicaname -domainUsername $cacertadminname -domainPassword $cacertadminpasswd -certificateTemplate $certtemplate
    -certificateRequestFile "c:\temp\SupervisorCluster.csr" -CertificateFile "c:\temp\SupervisorCluster.cer

scp C:\Users\Administrator\Documents\certs\esxi\esx-02a\certnew.cer root@esx-02a.corp.local:/tmp
# CSR certificate is renamed
mv certnew.cer rui.crt

# rename the original certificate
mv /etc/vmware/ssl/rui.crt /etc/vmware/ssl/orig.rui.crt
mv /etc/vmware/ssl/rui.key /etc/vmware/ssl/orig.rui.key

mv rui-orig.key rui.key

cp rui.key rui.crt /etc/vmware/ssl

services.sh restart


$mspkiservername="dc-rpl01.corp.local"
$mspkicaname="rainpole-DC-RPL01-CA"
$cacertadminname="nexus@corp.local"
$cacertadminpasswd="VMw@re1!"
$certtemplate="WebServer"

Request-SignedCertificate -mscaComputerName $mspkiservername -mscaName $mspkicaname -domainUsername $cacertadminname -domainPassword $cacertadminpasswd -certificateTemplate $certtemplate
    -certificateRequestFile "c:\temp\SupervisorCluster.csr" -CertificateFile "c:\temp\SupervisorCluster.cer