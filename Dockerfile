#===================================================
# https://github.com/P3TERX/ubuntu-plus
# Description: Ubuntu image with some extra packages
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#===================================================
ARG IMAGE_TAG=latest
FROM ubuntu:$IMAGE_TAG

LABEL maintainer P3TERX

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update -qq && apt-get upgrade -qqy && \
    apt-get install -qqy git wget curl vim nano htop tmux tree sudo ca-certificates zsh uuid-runtime tzdata openssh-server lrzsz xz-utils && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    mkdir /var/run/sshd && \
    useradd -m -G sudo -s /usr/bin/zsh user && \
    echo 'user:user' | chpasswd && \
    echo 'user ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/user && \
    chmod 440 /etc/sudoers.d/user && \
    curl -fsSL git.io/tmate.sh | bash && \
    curl -fsSL git.io/gotop.sh | bash -s install && \
    curl -fsSL git.io/bashtop.sh | bash -s install

USER user
WORKDIR /home/user

RUN mkdir -p ~/.ssh && \
    chmod 700 ~/.ssh && \
    curl -fsSL git.io/oh-my-zsh.sh | bash && \
    curl -fsSL git.io/oh-my-tmux.sh | bash

ENV TZ=Asia/Shanghai \
    LANG=C.UTF-8

EXPOSE 22

CMD [ "sudo", "/usr/sbin/sshd", "-D" ]
