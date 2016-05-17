#!/bin/sh
set -e

if [ "$1" = "znc" ]; then
  chown -R irc /var/run/ircd
  if [ "$#" -gt 1 ]; then
    shift
    exec su-exec irc /usr/bin/znc "$@"
  else
    exec su-exec irc /usr/bin/znc --help
  fi
fi

exec "$@"
