FROM debian:10-slim
LABEL maintainer="milos.kozak@lejmr.com"

RUN apt update \
    && apt install -y wget gnupg1 gosu \
    && wget -O- https://rspamd.com/apt-stable/gpg.key | apt-key add - \
    && echo "deb [arch=amd64] http://rspamd.com/apt-stable/ buster main" > /etc/apt/sources.list.d/rspamd.list \
    && apt update \
    && apt-get -y --no-install-recommends install rspamd \
    && sed -i 's/localhost/0.0.0.0/g' /etc/rspamd/rspamd.conf


# gosu _rspamd /usr/bin/rspamd -c /etc/rspamd/rspamd.conf -f
