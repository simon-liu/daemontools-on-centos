#!/bin/bash

cd /tmp
wget http://cr.yp.to/daemontools/daemontools-0.76.tar.gz
tar -xzvf daemontools-0.76.tar.gz
rm -f daemontools-0.76.tar.gz

cd admin/daemontools-0.76
echo gcc -O2 -include /usr/include/errno.h > src/conf-cc 
. package/install 

echo "start on runlevel [12345]" > /etc/init/svscan.conf
echo "respawn" >> /etc/init/svscan.conf
echo "exec /command/svscanboot" >> /etc/init/svscan.conf

initctl reload-configuration 
initctl start svscan 