FROM ubuntu:14.04

RUN apt-get update -qq && apt-get install -qq -y znc
RUN mkdir -p /var/run/ircd/configs
ADD znc.conf /var/run/ircd/configs/
RUN chown -R irc:irc /var/run/ircd
USER irc
RUN /usr/bin/znc -p -d /var/run/ircd

USER root
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER irc
ENTRYPOINT ["/usr/bin/znc"]
CMD ["-f", "-n", "-d", "/var/run/ircd"]
