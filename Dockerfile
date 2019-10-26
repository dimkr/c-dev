FROM debian:buster-slim

ENV ENV DEBIAN_FRONTEND noninteractive

RUN dpkg --add-architecture i386 && apt-get -qq update && apt-get -y upgrade && apt-get -y --no-install-recommends install gcc ninja-build python3-pip python3-setuptools python3-wheel python3-requests valgrind libc6:i386 libstdc++6:i386 zlib1g:i386 libmpc3:i386 xz-utils git make qemu-user-static ccache libncurses5-dev python3-venv strace git-lfs byacc flex wget gnupg autoconf automake libtool afl gdb-multiarch && git-lfs install
RUN wget -q http://mirrors.kernel.org/ubuntu/pool/main/m/mpfr4/libmpfr4_3.1.4-1_amd64.deb && dpkg -i libmpfr4_3.1.4-1_amd64.deb && rm -f libmpfr4_3.1.4-1_amd64.deb && wget -q http://mirrors.kernel.org/ubuntu/pool/main/m/mpfr4/libmpfr4_3.1.4-1_i386.deb && dpkg -i libmpfr4_3.1.4-1_i386.deb && rm -f libmpfr4_3.1.4-1_i386.deb
RUN wget -qO- https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - && printf "deb http://apt.llvm.org/buster/ llvm-toolchain-buster-9 main\ndeb http://apt.llvm.org/buster/ llvm-toolchain-buster main" > /etc/apt/sources.list.d/llvm.list && apt-get -qq update && apt-get -y --no-install-recommends install clang-9 llvm-9-dev clang-10 llvm-10-dev && ln -s /usr/bin/clang-9 /usr/local/bin/clang
RUN pip3 install meson awscli gcovr && for v in 0.46.1 0.51.2; do python3 -m venv /opt/meson-$v && . /opt/meson-$v/bin/activate && pip3 install wheel && pip3 install meson==$v && printf "#!/bin/sh -e\n. /opt/meson-$v/bin/activate\nexec meson \"\$@\"" > /usr/local/bin/meson-$v && chmod 755 /usr/local/bin/meson-$v; done
