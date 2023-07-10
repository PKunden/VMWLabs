!#/bin/bash
# download agent
export VRCLIHOST=vrli-md-vcf0-ko.corp.local
curl -k -o /tmp/liagent.rpm https://$VRCLIHOST/api/v1/agent/packages/types/rpm
rpm -Uvh /tmp/liagent.rpm

cd /var/lib/loginsight-agent/
# download agent complete

sudo vim /var/lib/loginsight-agent/liagent.ini

hostname=vrli-md-vcf0-ko.corp.local
proto=cfapi
port=9543
ssl=no

# Common configuration
systemctl restart liagentd.service
systemctl status liagentd.service

tail /var/log/loginsight-agent/liagent_

Connection to ber-vrcli-l-01.rainpole.dev:9543 successfully established

# DEBIAN
curl -k -o /tmp/liagent.deb https://$VRCLIHOST/api/v1/agent/packages/types/deb
sudo dpkg -i /tmp/liagent.deb

# verify that agent is installed.
dpkg -l | grep -i insight

sudo vim /var/lib/loginsight-agent/liagent.ini
hostname=ber-vrcli-l-01.rainpole.dev
proto=cfapi
port=9543
ssl=yes
ssl_ca_path=/etc/ssl/certs/drvca.pem

openssl s_client -showcerts -connect drvdc01.rainpole.dev:443

-----BEGIN CERTIFICATE-----
MIIFdTCCA12gAwIBAgIQFrPeQYcmNp1DE3V/Y9Wx2zANBgkqhkiG9w0BAQsFADBN
MRMwEQYKCZImiZPyLGQBGRYDZGV2MRgwFgYKCZImiZPyLGQBGRYIcmFpbnBvbGUx
HDAaBgNVBAMTE3JhaW5wb2xlLURSVkRDMDEtQ0EwHhcNMjMwMTI2MTQxODM3WhcN
MjgwMTI2MTQyODM2WjBNMRMwEQYKCZImiZPyLGQBGRYDZGV2MRgwFgYKCZImiZPy
LGQBGRYIcmFpbnBvbGUxHDAaBgNVBAMTE3JhaW5wb2xlLURSVkRDMDEtQ0EwggIi
MA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQCzf2pdwaHLpzpoWtgF82kIYl4t
Ck62EsnEYdX7fjdVOWeqS8bpRdDkb6dpp38jJqKcPEf95T7Ji9qtBSt8IuY5rRW6
CxSSSZU+9+UtESamDAzvdN9QB7WQgmh57z0bkFMkeOT7wHay1oYrDcTShdXdQjFk
qyCX3vWr2D1NvyEpzRKbd+skg63L50hAVTUKtxY3vcKA2TrVoELhjLATXVFohy42
MAyT0pfGjVUuwcCjJCMywwNa2ZiOr2ygcerJIEhvImiLxrAedsZHxSLnXuQ4JYXC
GxFyw7Xvwgq+Oe4pjAyVU+x0cfz55vP+L4eh8nNwtBOJnq30ZAhvQ2dvTZGJK4v8
9vuG8t+lbfI8jfNLnMn6gkjoHLryBGaOOv5bZGLr3FjPVnckasYt01pZyNmRzayM
gR3LVq93Ac/WOUVFBR7Lib5x77/XAInJbo3aSdpV1EZXk1rGuFlAFCIUUnJnOJXs
y3hK+JBGYtSPjFuF05K8z3I37N5ga9e5XEyWuqtcfRU3ohA1AeeS5y7Ud/WnPAli
SbGikBMEUBZe6mBFHIfhJ6DDwv2xRUnS17QThV38KfcCTUsD/DDW77NKWzf5L4Dc
LpEormzIgBFaEjm7GV4sYXbRGdT45jbjIwmJtNbKMKvJkbzemqZe7WKei5SB4hZl
XbrmveRCFO82NREMKQIDAQABo1EwTzALBgNVHQ8EBAMCAYYwDwYDVR0TAQH/BAUw
AwEB/zAdBgNVHQ4EFgQUUvZZCULQw3L4aQGmHM/l+QQ8klcwEAYJKwYBBAGCNxUB
BAMCAQAwDQYJKoZIhvcNAQELBQADggIBACl8vv5lCunOB1J/KXKZLgqm1FtZ1vWg
HOCqotoD4LmsFHUfEsldb64BSNr/Vs4FipGybiVkKdxGn9cWMT62LnjFWzkPnKTU
AYMZqlZgyeHswEv4ZrtyyYaVVCXJif1g+ydo98sshcGJ5OF0CmOL+RGiHxaNUP6/
9UV7Oo/d3ADbwhXj/mzI9mEUSdNHZYBUNU7Z7JX8ZOl6if1ktAzcvL/dm816OABz
0XyQEPmRFAqsWwS0Mfarj8yPu/vt/xVF8QTG+ebHq/9V41KU9SJV92codJuhHUhE
04iCXZqoVNsAQ8WXz4Ao/3VNdgUF2n8umCKmvjqNn743+zKbowpzG4SETIihHG5I
DurEbQHxr/MHfGz21ZcF1Mqep2aUN9H/D8q8djYAx+lVVukBwYvBoulJfCWlaPoK
araxEesq5BHqDYQGCz6mhdUA+9sPuTPHYZAIrle49OwL/1lNzElSwzskqCcGNSSU
pmOJ4Oa3Y/rqd7MDygZEZp5/VWTqrIFvyiIZmEYTKBeKAU8E7yxp1+pP2A1W4EYY
CI6ObASccEoGWjRpDcdf/j/i2INbvdES34pel3nvm1YtObYBqxSTElk5As8V054X
pFOwh8GCxUoGVn/i8wz8iFmOpJa5wXpxq0fVc0CGyGzP5PDLvwdO4FlmMhZYN0wc
vuEu9VORGdxj
-----END CERTIFICATE-----

/etc/ssl/certs/drvca.pem

#----- INFO from liagent.deb ---------#

preetam@ber-l-db01:/tmp$ dpkg -c liagent.deb
drwxr-xr-x root/root 0 2021-12-16 15:47 ./
drwxr-xr-x root/root 0 2021-12-16 15:47 ./usr/
drwxr-xr-x root/root 0 2021-12-16 15:47 ./usr/lib/
drwxr-xr-x root/root 0 2021-12-16 15:47 ./usr/lib/loginsight-agent/
-rwxr-xr-x root/root 983 2021-12-16 15:47 ./usr/lib/loginsight-agent/vmware-packaging-gpg-rsa-pub.key
drwxr-xr-x root/root 0 2021-12-16 15:47 ./usr/lib/loginsight-agent/bin64/
-rwxr-xr-x root/root 1008528 2021-12-16 15:47 ./usr/lib/loginsight-agent/bin64/loginsight-agent-support
-rwxr-xr-x root/root 1795688 2021-12-16 15:47 ./usr/lib/loginsight-agent/bin64/liupdater
-rwxr-xr-x root/root 5566680 2021-12-16 15:47 ./usr/lib/loginsight-agent/bin64/liagent
-rwxr-xr-x root/root 507363 2021-12-16 15:47 ./usr/lib/loginsight-agent/open_source_licenses.txt
drwxr-xr-x root/root 0 2021-12-16 15:47 ./usr/lib/loginsight-agent/lib64/
-rwxr-xr-x root/root 464440 2021-12-16 15:47 ./usr/lib/loginsight-agent/lib64/libssl.so.1.0.2
-rwxr-xr-x root/root 2866816 2021-12-16 15:47 ./usr/lib/loginsight-agent/lib64/libcrypto.so.1.0.2
-rwxr-xr-x root/root 469 2021-12-16 15:47 ./usr/lib/loginsight-agent/NOTICE.txt
drwxr-xr-x root/root 0 2021-12-16 15:47 ./usr/lib/loginsight-agent/lib32/
-rwxr-xr-x root/root 429968 2021-12-16 15:47 ./usr/lib/loginsight-agent/lib32/libssl.so.1.0.2
-rwxr-xr-x root/root 2412776 2021-12-16 15:47 ./usr/lib/loginsight-agent/lib32/libcrypto.so.1.0.2
-rwxr-xr-x root/root 1507 2021-12-16 15:47 ./usr/lib/loginsight-agent/LICENSE.txt
drwxr-xr-x root/root 0 2021-12-16 15:47 ./usr/lib/loginsight-agent/bin32/
-rwxr-xr-x root/root 1054496 2021-12-16 15:47 ./usr/lib/loginsight-agent/bin32/loginsight-agent-support
-rwxr-xr-x root/root 1819924 2021-12-16 15:47 ./usr/lib/loginsight-agent/bin32/liupdater
-rwxr-xr-x root/root 5890536 2021-12-16 15:47 ./usr/lib/loginsight-agent/bin32/liagent
drwxr-xr-x root/root 0 2021-12-16 15:47 ./etc/
drwxr-xr-x root/root 0 2021-12-16 15:47 ./etc/init.d/
-rwxr-xr-x root/root 7661 2021-12-16 15:47 ./etc/init.d/liagentd
-rwxr-xr-x root/root 7372 2021-12-16 15:47 ./etc/init.d/liupdaterd
drwxr-xr-x root/root 0 2021-12-16 15:47 ./var/
drwxr-xr-x root/root 0 2021-12-16 15:47 ./var/lib/
drwxr-xr-x root/root 0 2021-12-16 15:47 ./var/lib/loginsight-agent/
-rwxr-xr-x root/root 2307 2021-12-16 15:47 ./var/lib/loginsight-agent/liagent.ini
preetam@ber-l-db01:/tmp$

#------------

vmware-log-insight-agent vmware-log-insight-agent/init_system string
vmware-log-insight-agent vmware-log-insight-agent/serverhost string
vmware-log-insight-agent vmware-log-insight-agent/ssl string
vmware-log-insight-agent vmware-log-insight-agent/auto_update string
#-------------
debconf-show vmware-log-insight-agent
SERVERHOST=
SSL=yes
init_system
should_run_services
#------------

sudo vim /var/lib/loginsight-agent/liagent.ini
hostname=ber-vrcli-l-01.rainpole.dev
proto=cfapi
port=9543
ssl=yes
ssl_ca_path=/etc/ssl/certs/drvca.pem

sudo SERVERHOST=$VRCLIHOST SERVERPORT=9000 SERVERPROTO=cfapi LIAGENT_AUTOUPDATE=yes dpkg -i /tmp/liagent.deb
dpkg -l | grep -i insight
less /var/lib/loginsight-agent/liagent.ini

systemctl restart liagentd.service
systemctl status liagentd.service

tail /var/log/loginsight-agent/liagent_

#!/bin/bash
for log in {1..500}; do
    logger -i -p 1 $value OurEvent
done
# every line ends with ; remember this.
