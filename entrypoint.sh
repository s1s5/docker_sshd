#!/bin/bash
# -*- mode: shell-script -*-

set -eu  # <= 0以外が返るものがあったら止まる, 未定義の変数を使おうとしたときに打ち止め

mkdir ~/.ssh

sed -i 's/#HostKey \/etc\/ssh\/ssh_host_rsa_key/HostKey \/etc\/ssh\/ssh_host_rsa_key/' /etc/ssh/sshd_config
chown root:root /etc/ssh/ssh_host_rsa_key
chmod 0400 /etc/ssh/ssh_host_rsa_key

chown root:root /etc/ssh/ssh_host_rsa_key.pub
chmod 0444 /etc/ssh/ssh_host_rsa_key.pub

echo ${AUTHORIZED_KEYS} > ~/.ssh/authorized_keys
chmod 0400 ~/.ssh/authorized_keys

/usr/sbin/sshd -D
