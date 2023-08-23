!#/bin/bash
# download agent
# openssl s_client -showcerts -connect drvdc01.rainpole.dev:443
export VRCLIHOST=vrli-md-vcf0-ko.corp.local
curl -k -o /tmp/liagent.rpm https://$VRCLIHOST/api/v1/agent/packages/types/rpm
rpm -Uvh /tmp/liagent.rpm

sed -i 's/;hostname=LOGINSIGHT/hostname=$VRCLIHOST/g' /var/lib/loginsight-agent/liagent.ini
sed -i 's/;ssl=yes/ssl=no/g' /var/lib/loginsight-agent/liagent.ini
ssl_ca_path=/etc/ssl/certs/drvca.pem
/etc/init.d/liagentd restart
/etc/init.d/liagentd status

# systemctl restart liagentd.service
# systemctl status liagentd.service
