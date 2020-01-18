#!/bin/bash

docker build -t rspamd .

echo "starting rspamd"
docker run --rm -ti -p 11332:11332 -p 11334:11334  rspamd:latest gosu _rspamd /usr/bin/rspamd -c /etc/rspamd/rspamd.conf -f