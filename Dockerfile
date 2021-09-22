FROM ubuntu:20.04

RUN apt-get update && apt-get install -y --no-install-recommends openssh-server
RUN mkdir /var/run/sshd

# ssh設定ファイルの書換え
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config

# https://superuser.com/questions/588591/how-to-make-an-ssh-tunnel-publicly-accessible
# ssh -R 0.0.0.0:8080:localhost:80 -N root@example.com
# if you use OpenSSH sshd server, the server's GatewayPorts option needs to be enabled
RUN sed -i 's/#GatewayPorts no/GatewayPorts yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

COPY entrypoint.sh /root/entrypoint.sh

CMD /bin/bash /root/entrypoint.sh
