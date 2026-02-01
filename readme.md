# micro:bit assembly programming

* Board: micro:bit V1.3
  * [micro:bit V1.3 reference page](https://tech.microbit.org/hardware/1-3-revision/)
* Chip: nRF51822
  * [nRF51 series reference manual](https://docs-be.nordicsemi.com/bundle/nRF51-Series/raw/resource/enus/nRF51_RM_v3.0.1.pdf)
  * [nRF51822 product specification](https://docs-be.nordicsemi.com/bundle/nRF51-Series/raw/resource/enus/nRF51822_PS_v3.4.pdf)
  * [ARMv6-M Architecture Reference Manual](https://documentation-service.arm.com/static/5f8ff05ef86e16515cdbf826)
* OpenOCD support
  * Target chip (nRF51): https://github.com/openocd-org/openocd/blob/master/tcl/target/nordic/nrf51.cfg
  * Interface (CMSIS-DAP): https://github.com/openocd-org/openocd/blob/master/tcl/interface/cmsis-dap.cfg
  * Documentation: https://openocd.org/doc/html/

## Build dependencies

* `coreutils`
* `sh`
* `just`: https://github.com/casey/just
* `podman`: https://github.com/containers/podman
