FROM debian:buster-slim

ENV LC_ALL C
ENV LANG C

RUN apt-get -qq update && apt-get -y upgrade && apt-get -y --no-install-recommends install gcc libc6-dev ninja-build python3-minimal python3-pip python3-setuptools python3-wheel xz-utils git ccache git-lfs byacc flex; pip3 install meson && git-lfs install && apt-get autoremove --purge -y python3-pip python3-setuptools python3-wheel
