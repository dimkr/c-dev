FROM ubuntu:bionic

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV ENV DEBIAN_FRONTEND noninteractive

RUN dpkg --add-architecture i386
RUN sed -i s/^deb.*multiverse.*/\#\&/g /etc/apt/sources.list
RUN wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add -
RUN printf "deb http://apt.llvm.org/bionic/ llvm-toolchain-bionic-7 main\ndeb http://apt.llvm.org/bionic/ llvm-toolchain-bionic-8 main\ndeb http://apt.llvm.org/bionic/ llvm-toolchain-bionic main" > /etc/apt/sources.list.d/llvm.list
RUN apt-get -qq update && apt-get -y --no-install-recommends install gcc gcc-8 clang llvm-dev clang-7 clang-8 clang-9 ninja-build locales python3-pip python3-setuptools python3-wheel valgrind aria2 libc6:i386 libstdc++6:i386 zlib1g:i386 libmpc3:i386 xz-utils git make qemu-user-static ccache wget curl libncurses5-dev pkg-config && apt-get autoremove --purge && apt-get autoclean
RUN wget -q http://mirrors.kernel.org/ubuntu/pool/main/m/mpfr4/libmpfr4_3.1.4-1_amd64.deb && dpkg -i libmpfr4_3.1.4-1_amd64.deb && rm -f libmpfr4_3.1.4-1_amd64.deb
RUN wget -q http://mirrors.kernel.org/ubuntu/pool/main/m/mpfr4/libmpfr4_3.1.4-1_i386.deb && dpkg -i libmpfr4_3.1.4-1_i386.deb && rm -f libmpfr4_3.1.4-1_i386.deb
RUN locale-gen --lang en_US.UTF-8
RUN pip3 install meson==0.46.1 awscli
