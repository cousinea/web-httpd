FROM httpd

COPY ./skel /

RUN ls -l /

RUN apt-get update
    
RUN chmod +x init.sh

CMD ["./init.sh"]
