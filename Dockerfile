FROM ubuntu:bionic

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV ENV DEBIAN_FRONTEND noninteractive

RUN dpkg --add-architecture i386
RUN sed -i s/^deb.*multiverse.*/\#\&/g /etc/apt/sources.list
RUN apt-get -qq update && apt-get -y --no-install-recommends install gcc clang llvm-dev ninja-build locales python3-pip python3-setuptools python3-wheel valgrind aria2 libc6:i386 libstdc++6:i386 zlib1g:i386 xz-utils git make qemu-user-static ccache wget curl libncurses5-dev pkg-config libglib2.0-dev libsoup2.4-dev libjson-glib-dev systemd && apt-get autoremove --purge && apt-get autoclean
RUN locale-gen --lang en_US.UTF-8
RUN pip3 install meson==0.46.1
