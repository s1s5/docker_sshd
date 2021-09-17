# docker sshd

## テスト実行
```
docker run --rm -t -i -p 22222:22 -e AUTHORIZED_KEYS="`cat ~/.ssh/id_rsa.pub`" test-sshd
```

## テストログイン
```
ssh -o  StrictHostKeyChecking=no  root@localhost -p 22222
```


`ssh-keygen -q -N "" -t rsa -b 4096 -f ssh_host_rsa_key`
