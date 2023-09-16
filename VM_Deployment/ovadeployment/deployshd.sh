# script to deploy skyline health diagnostic
# IP Address should also be converted into variable
export vmname="SkylineHD02"
export dsname="clu1-mgmt-vsan01"
export hostname="SkylineHD02"
export vclocation="vi://vc-mgmt.rainpole.dev/clu1-mgmt-ber/host/clu1-mgmt"
export ovalocation="/home/preetam/ova/VMware-Skyline-HealthDiagnostics-Appliance-4.0.0-21961090_OVF10.ova"

./ovftool --acceptAllEulas --datastore=$dsname \
    --name=$vmname \
    --net:"VM_Network"="clu1-mgmt-vds01-pg-mgmt" \
    --prop:"root-password"="PSGlobalCloud123!" \
    --prop:"shd-admin-password"="PSGlobalCloud123!" \
    --prop:"hostname"=$hostname \
    --prop:"netipaddress"=172.16.11.206 \
    --prop:"netprefix"=24 \
    --prop:"netgateway"=172.16.11.253 \
    --prop:"netdns"=192.168.0.253 \
    --prop:"netntp"=192.168.0.253 \
    $ovalocation \
    $vclocation
