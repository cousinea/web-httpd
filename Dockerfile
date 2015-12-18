FROM httpd

COPY ./skel /

RUN ls -l /

RUN apt-get update
    
RUN which chmod

RUN pwd

RUN cp /index.html /usr/local/apache2/htdocs/.

RUN cat /init.sh

RUN chmod +x /init.sh

#ENTRYPOINT ["/usr/local/apache2/sbin/httpd", "-D", "FOREGROUND"]

CMD ["/init.sh"]

#RUN /usr/local/apache2/bin/httpd -DFOREGROUND
