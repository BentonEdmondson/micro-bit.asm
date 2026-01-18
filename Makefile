MAKEFLAGS += --no-builtin-rules

target/%.bin: target/%.elf
	arm-none-eabi-objcopy --output-target binary --only-section .text $< $@

target/firmware.elf: src/main.s target
	arm-none-eabi-as $< -o $@

target:
	mkdir $@
