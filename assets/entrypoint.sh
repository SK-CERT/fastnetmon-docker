#!/bin/sh

if [ ! -e /opt/fastnetmon/assets/etc/networks_list ] || [ ! -e /opt/fastnetmon/assets/etc/networks_whitelist ]; then
  echo "# Bootstrapping network lists"
  mkdir -vp /opt/fastnetmon/assets/etc/

  # touch network list files
  touch /opt/fastnetmon/assets/etc/networks_list /opt/fastnetmon/assets/etc/networks_whitelist

  echo "# DONE"
fi

exec "$@"
