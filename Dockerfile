FROM rabbitmq:3.6.5

MAINTAINER Rory Hunter <roryhunter2@gmail.com>

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["configure-rabbitmq-ha"]
