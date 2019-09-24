FROM debian:buster-slim

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -qq update && apt-get -y upgrade && apt-get -y --no-install-recommends install gcc ninja-build locales python3-pip python3-setuptools python3-wheel valgrind git make ccache git-lfs byacc flex wget gnupg; git-lfs install
RUN wget -qO- https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - && printf "deb http://apt.llvm.org/buster/ llvm-toolchain-buster-9 main" > /etc/apt/sources.list.d/llvm.list && apt-get -qq update && apt-get -y --no-install-recommends install clang-9 llvm-9-dev && ln -s /usr/bin/clang-9 /usr/local/bin/clang
RUN locale-gen --lang en_US.UTF-8 && pip3 install meson
