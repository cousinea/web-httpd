FROM httpd

COPY ./skel /

RUN apt-get update
    
RUN cp /index.html /usr/local/apache2/htdocs/.

RUN chmod +x /init.sh

CMD ["/init.sh"]
