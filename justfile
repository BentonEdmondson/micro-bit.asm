set shell := ["fish", "--command"]

tag := "micro-bit.asm:latest"
run := "podman run " + tag

setup:
    podman build --quiet --tag {{tag}} .

flash: setup
    {{run}} openocd \
        --file interface/cmsis-dap.cfg \
        --file target/nrf51.cfg \
        --command 'transport select swd' \
        --command 'program target/firmware.bin 0x0 preverify verify reset exit'

run +args: setup
    {{run}} {{args}}
