# If you connect to the internet through a proxy server, use the --proxyServer, --ps
# option to specify the FQDN and port of the proxy server. For example, --proxyServer FQDN:port
# below are the manual steps
# download asyncPatchTool
# do not forget to add ssh-keep-alive
# VCF over VxRail, you need to use --pdu dell_emc_depot_email

mkdir /home/vcf/asyncPatchTool
cp vcf-async-patch-tool- <version >.tar.gz
cd /home/vcf/asyncPatchTool
tar -xvf vcf-async-patch-tool- <version >.tar.gz
cd ..
chmod -R 755 asyncPatchTool
chown -R vcf:vcf asyncPatchTool
cd asyncPatchTool/bin

export customer_connect_email=youremail@vmwareconnect.com # your vmware connect email address
export SSOuser=administrator@vsphere.local
export vcf=vcf
patchdetails=VCENTER:7.0.3.01500-21784236 # patch details of your choice

./vcf-async-patch-tool --listAsyncPatch --du $customer_connect_email

# pre-check
./vcf-async-patch-tool -e --patch $patchdetails --du $customer_connect_email --sddcSSOUser $SSOuser --sddcSSHUser $vcf --precheck --it ONLINE

# actual installation
./vcf-async-patch-tool -e --patch $patchdetails --du $customer_connect_email --sddcSSOUser $SSOuser --sddcSSHUser $vcf --it ONLINE

# reset/set the thing back to normal
./vcf-async-patch-tool -disableAllPatches --sddcSSOUser $SSOuser --sddcSSHUser $vcf
