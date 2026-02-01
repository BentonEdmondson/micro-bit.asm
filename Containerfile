FROM debian@sha256:5cf544fad978371b3df255b61e209b373583cb88b733475c86e49faa15ac2104

RUN apt-get update
RUN apt-get install -y openocd
RUN apt-get install -y gcc-arm-none-eabi
RUN apt-get install -y make
RUN apt-get install -y gdb-multiarch
RUN apt-get install -y curl
RUN apt-get install -y xz-utils
RUN curl -qsL 'https://install.pwndbg.re' | sh -s -- -t pwndbg-gdb
