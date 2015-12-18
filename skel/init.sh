#!/bin/bash

cd /

build=$(cat build)

sed -i -e "s|<containerid>|$(hostname)|g"  \
       -e "s|<build>|$build|g"       \
       /usr/local/apache2/htdocs/index.html

PASSVAL=`grep PASSWORD /password | cut -d= -f2`

sed -i "s/PASSWORD/$PASSVAL/g" /usr/local/apache2/htdocs/index.html

echo "Hi, I'm in init.sh"
#while [ "1" -eq "1" ]; do sleep 60; done

/usr/local/apache2/bin/httpd -DFOREGROUND
