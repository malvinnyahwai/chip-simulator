FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y openssh-server nano gcc gdb nasm \
    gdbserver gdb-multiarch libc6-dbg libstdc++6-12-dbg python3-pip \
    libpython3-dev ncurses-bin \
    && mkdir -p /var/run/sshd /workspace/documents && \
    echo 'root:root' | chpasswd && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config && \
    echo "AllowUsers root" >> /etc/ssh/sshd_config

EXPOSE 22

WORKDIR /workspace

VOLUME ["/workspace/documents"]

CMD ["/usr/sbin/sshd", "-D"]
    
