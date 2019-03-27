#!/bin/bash

yum -y install rpm-build redhat-rpm-config make gcc

cd daemontools-rpm
./buildrpm.sh

rpm -ivh /root/rpmbuild/RPMS/x86_64/daemontools-*.rpm

IS_REDHAT7=`uname -a | grep '.el7.' | wc -l`
if [ "$IS_REDHAT7" -eq "1" ]
then
    systemctl enable daemontools.service
    systemctl start daemontools.service
else
    initctl start daemontools
fi
