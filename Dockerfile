FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y openssh-server nano gcc gdb nasm \
    && mkdir -p /var/run/sshd /workspace/documents && \
    echo 'root:root' | chpasswd && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config && \
    echo "AllowUsers root" >> /etc/ssh/sshd_config

EXPOSE 22

WORKDIR /workspace

VOLUME ["/workspace/documents"]

CMD ["/usr/sbin/sshd", "-D"]
    
