[![Alire](https://img.shields.io/endpoint?url=https://alire.ada.dev/badges/a0b_armv7m.json)](https://alire.ada.dev/crates/a0b_armv7m.html)

# ARMv7-M Support (Cortex-M3/M4/M7)

This crate provides registers description of ARMv7-M CPUs, as well as some utility subprograms, including reading/setting of the system registers and data/instruction synchronization.
While they are rare necessary for user applications, they are used by the some A0B system level crates.

## Usage Notes

This crate defines `FPU_Extension` configuration variable with few possible values:
 * `none` FPU extension is not implemented
 * `VFPv4` FPU extension, usually available on Cortex-M4 chips
 * `VFPv5` FPU extension, usually available on Cortex-M7 chips

`A0B_ARMv7M` project file defines `FPU_Extension` parameter that might be used by project files to detect support of the FPU by the chip.

Usually, `FPU_Extension` variable is defined by the Board Support Package crate, and user application must never change this parameter.
