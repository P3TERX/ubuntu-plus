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

ENV DEBIAN_FRONTEND=noninteractive \
    TZ=Asia/Shanghai \
    LANG=C.UTF-8

RUN apt-get update -qq && apt-get upgrade -qqy && \
    apt-get install -qqy git wget curl vim nano htop tmux tree sudo ca-certificates zsh command-not-found uuid-runtime tzdata openssh-server lrzsz xz-utils && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    mkdir /var/run/sshd && \
    useradd -m -G sudo -s /usr/bin/zsh user && \
    echo 'user:user' | chpasswd && \
    echo 'user ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/user && \
    chmod 440 /etc/sudoers.d/user && \
    curl -fsSL git.io/gotop.sh | bash && \
    curl -fsSL git.io/tmate.sh | bash

USER user
WORKDIR /home/user

RUN mkdir -p ~/.antigen && \
    curl -fsSL git.io/antigen > ~/.antigen/antigen.zsh && \
    curl -fsSL https://raw.githubusercontent.com/P3TERX/dotfiles/master/.zshrc > ~/.zshrc && \
    curl -fsSL git.io/oh-my-tmux.sh | bash && \
    mkdir -p ~/.ssh && \
    chmod 700 ~/.ssh && \
    zsh ~/.zshrc

EXPOSE 22

CMD [ "sudo", "/usr/sbin/sshd", "-D" ]
