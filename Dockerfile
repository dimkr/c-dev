FROM debian:buster-slim

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -qq update && apt-get -y upgrade && apt-get -y --no-install-recommends install gcc libc6-dev ninja-build python3-pip python3-setuptools python3-wheel xz-utils git ccache git-lfs byacc flex; git-lfs install
RUN pip3 install meson
