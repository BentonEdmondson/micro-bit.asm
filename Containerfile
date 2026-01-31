from debian@sha256:5cf544fad978371b3df255b61e209b373583cb88b733475c86e49faa15ac2104

run apt-get update
run apt-get install -y openocd
run apt-get install -y gcc-arm-none-eabi
run apt-get install -y make
run apt-get install -y gdb-multiarch
run apt-get install -y curl
run apt-get install -y xz-utils
run curl -qsL 'https://install.pwndbg.re' | sh -s -- -t pwndbg-gdb
