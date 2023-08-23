"C:\Program Files\VMware\VMware OVF Tool\ovftool.exe" --noSSLVerify --skipManifestCheck --powerOn --diskMode=thin --acceptAllEulas --allowExtraConfig --ipProtocol=IPv4 ^
--ipAllocationPolicy=fixedPolicy ^
--prop:ROOT_PASSWORD="PSGlobalCloud123!" ^
--prop:VCF_PASSWORD="PSGlobalCloud123!" ^
--prop:BASIC_AUTH_PASSWORD="PSGlobalCloud123!" ^
--prop:BACKUP_PASSWORD="PSGlobalCloud123!" ^
--prop:vami.hostname="sddc-md-vcf0-ko.rainpole.dev" ^
--prop:guestinfo.ntp="192.168.0.253" ^
--prop:vami.gateway.SDDC-Manager="172.16.11.253" ^
--prop:vami.domain.SDDC-Manager="rainpole.dev" ^ 
--prop:vami.searchpath.SDDC-Manager="rainpole.dev" ^ 
--prop:vami.DNS.SDDC-Manager="192.168.0.253" ^
--prop:vami.ip0.SDDC-Manager="172.16.11.59" ^
--prop:vami.netmask0.SDDC-Manager="255.255.255.0" ^
--datastore="cl1-md-vcf0-ko-vsan01" --name="sddc-md-vcf0-ko-restore" ^
--network="cl1-md-vcf0-ko-vds01-pg-mgmt" --X:injectOvfEnv ^
--X:waitForIp C:\Bits\VCF-SDDC-Manager-Appliance-4.5.0.0-20612863.ova ^
"vi://administrator@vsphere.local:PSGlobalCloud123!@vc-md-vcf0-ko.rainpole.dev/cl1-md-vcf0-ko-dc01/host/cl1-md-vcf0-ko-cl01//Resources/"