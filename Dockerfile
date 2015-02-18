FROM ubuntu:14.04

RUN apt-get update -qq && apt-get install -qq -y znc
RUN mkdir -p /var/run/ircd
RUN chown -R irc:irc /var/run/ircd

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER irc
CMD ["/usr/bin/znc", "-f", "-n", "-d", "/var/run/ircd"]
