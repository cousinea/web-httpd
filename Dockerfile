FROM httpd

COPY ./skel /

RUN ls -l /

RUN apt-get update
    
RUN which chmod

RUN cat init.sh

RUN chmod +x init.sh

CMD ["./init.sh"]
