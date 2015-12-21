#!/bin/bash

cd /

build=$(cat build)

sed -i -e "s|<containerid>|$(hostname)|g"  \
       -e "s|<build>|$build|g"       \
       /usr/local/apache2/htdocs/index.html

PASSVAL=`grep PASSWORD /password | cut -d= -f2`

sed -i "s/PASSWORD/$PASSVAL/g" /usr/local/apache2/htdocs/index.html

mount | grep opt

ls -l /opt/httpd/conf/httpd.conf

/usr/local/apache2/bin/httpd -DFOREGROUND -f /opt/httpd/conf/httpd.conf
