set shell := ["fish", "--command"]

tag := "micro-bit.asm:latest"
pod := "podman run " + "--mount type=bind,src=.,dst=/... " + "--workdir /... " + tag

setup:
    podman image exists {{ tag }}; or podman build --tag {{ tag }} .

clean: setup
    rm -r target

build: setup
    mkdir -p target
    {{ pod }} arm-none-eabi-as src/main.s -o target/firmware.elf
    {{ pod }} arm-none-eabi-objcopy --output-target binary --only-section .text target/firmware.elf target/firmware.bin

analyze: build
    {{ pod }} arm-none-eabi-objdump --disassemble target/firmware.elf

flash: build
    {{ pod }} openocd --file openocd.cfg --command 'program target/firmware.bin 0x0 preverify verify reset exit'

debug: build
    {{ pod }} openocd --file openocd.cfg

run +args: setup
    {{ pod }} {{ args }}
