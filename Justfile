set shell := [
    "podman", "container", "run",
    "--mount", "type=bind,src=.,dst=/...",
    "--privileged",
    "--interactive",
    "--network=host",
    "--workdir", "/...",
    "micro-bit.asm:7db0a40",
    "bash", "-c"
]

# To do: make --privileged instead be --userns=keep-id or something

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
    make target/firmware.bin target/firmware.elf

analyze: build
    arm-none-eabi-objdump --disassemble target/firmware.elf

flash: build
    openocd --file openocd.cfg --command 'program target/firmware.bin verify reset exit'

debug-server:
    openocd --file openocd.cfg

debug-client:
    pwndbg --eval-command 'target extended-remote :3333' --symbols target/firmware.elf

run +args:
    {{ args }}
