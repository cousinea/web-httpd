#!/bin/bash

cd /

build=$(cat build)

sed -i -e "s|<containerid>|$(hostname)|g"  \
       -e "s|<build>|$build|g"       \
       /usr/local/apache2/htdocs/index.html

PASSVAL=`grep PASSWORD /password | cut -d= -f2`

sed -i "s/PASSWORD/$PASSVAL/g" /usr/local/apache2/htdocs/index.html

/usr/local/apache2/bin/httpd -DFOREGROUND
