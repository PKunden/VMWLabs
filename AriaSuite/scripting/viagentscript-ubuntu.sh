
sed -i 's/;hostname=LOGINSIGHT/hostname=vr-loginsight.corp.local/g' /var/lib/loginsight-agent/liagent.ini
sed -i 's/;ssl=yes/ssl=no/g' /var/lib/loginsight-agent/liagent.ini
/etc/init.d/liagentd restart


VRCLIHOST=ber-vrcli-l-01.rainpole.dev
export VRCLIHOST
