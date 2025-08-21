FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y stunnel4 openssh-server curl sudo

RUN mkdir /var/run/sshd
RUN echo 'root:password' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

EXPOSE 22 443

CMD ["/usr/sbin/sshd", "-D"]
