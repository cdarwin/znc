FROM gliderlabs/alpine:3.3

RUN apk-install znc su-exec\
  && adduser irc -h /var/run/ircd -D

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

WORKDIR /var/run/ircd
VOLUME /var/run/ircd
CMD ["znc"]
