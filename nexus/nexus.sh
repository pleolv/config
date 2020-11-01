#!/bin/bash

#ssh root@${HOST}
adduser nexus
mkdir -p /app
cp -a * /app/
sudo chown -R nexus:nexus /app/nexus
sudo chown -R nexus:nexus /app/sonatype-work
sed -i 's/#run_as_user=""/run_as_user="nexus"/g' /app/nexus/bin/nexus.rc
sed -i 's/-Xms1200M/-Xms512M/g' /app/nexus/bin/nexus.vmoptions
sed -i 's/-Xmx1200M/-Xmx512M/g' /app/nexus/bin/nexus.vmoptions

cp nexus.service /etc/systemd/system/nexus.service

