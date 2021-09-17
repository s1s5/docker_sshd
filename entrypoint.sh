#!/bin/bash
# -*- mode: shell-script -*-

set -eu  # <= 0以外が返るものがあったら止まる, 未定義の変数を使おうとしたときに打ち止め

mkdir ~/.ssh
echo ${AUTHORIZED_KEYS} > ~/.ssh/authorized_keys
chmod 0400 ~/.ssh/authorized_keys

/usr/sbin/sshd -D
