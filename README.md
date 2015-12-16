# web-httpd
Nginx Container

You will need 2 execute build steps in Jenkins:

git clone https://github.com/cousinea/web-httpd.git
echo ${BUILD_NUMBER} > web-httpd/skel/build
echo 'PASSWORD=1234' > web-httpd/skel/password
docker build -t docker-pilot.dsc.umich.edu:31111/web-httpd web-httpd/
docker tag -f docker-pilot.dsc.umich.edu:31111/web-httpd docker-pilot.dsc.umich.edu:31111/web-httpd:${BUILD_NUMBER}
docker push docker-pilot.dsc.umich.edu:31111/web-httpd 

sed -i -e "s|docker-pilot.dsc.umich.edu:31111/web-httpd:latest|docker-pilot.dsc.umich.edu:31111/web-httpd:$BUILD_NUMBER|g" \ web-httpd/web-httpd.host.marathon.local.json
curl -X PUT -H "Accept: application/json" -H "Content-Type: application/json" \ http://docker-pilot.dsc.umich.edu:8080/v2/apps/web-httpd -d @web-httpd/web-httpd.host.marathon.local.json
