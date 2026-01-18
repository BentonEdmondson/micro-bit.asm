set shell := [
    "podman", "container", "run",
    "--mount", "type=bind,src=.,dst=/...",
    "--workdir", "/...",
    "micro-bit.asm:7db0a40",
    "bash", "-c"
]

setup: clean
    #!/usr/bin/env sh
    set -e
    podman image build --tag micro-bit.asm:7db0a40 .

clean:
    #!/usr/bin/env sh
    set -e
    rm -rfv target
    if podman image exists micro-bit.asm:7db0a40; then
        podman image untag micro-bit.asm:7db0a40
        echo "removed image 'micro-bit.asm:7db0a40'"
    fi

build:
    make target/firmware.bin

analyze: build
    arm-none-eabi-objdump --disassemble target/firmware.elf

flash: build
    openocd --file openocd.cfg --command 'program target/firmware.bin 0x0 verify reset exit'

debug: build
    openocd --file openocd.cfg

run +args:
    {{ args }}
