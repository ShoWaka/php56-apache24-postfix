#!/bin/bash

set -e

# リレーホストの設定
echo "relayhost = $MAIL_SERVICE" >> /etc/postfix/main.cf

# Postfixを起動
/usr/sbin/postfix -c /etc/postfix start

exec "$@"