FROM sebp/elk:780

ARG LOGSTASH_CONF_D=/etc/logstash/conf.d/

RUN cd ${LOGSTASH_CONF_D} \
 && mv 02-beats-input.conf 02-beats-input.conf.backup \  
 && mv 30-output.conf 30-output.conf.backup  

COPY 02-input.conf ${LOGSTASH_CONF_D}

COPY 30-output.conf ${LOGSTASH_CONF_D}

CMD [ "/usr/local/bin/start.sh" ]
