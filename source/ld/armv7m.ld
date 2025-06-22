/*
 *  Copyright (C) 2024-2025, Vadim Godunko <vgodunko@gmail.com>
 *
 *  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
 */

/*
 * Common mapping of sections to memory regions. Following memory regions
 * should defined:
 *   DEFAULT_VECTORS
 *   DEFAULT_TEXT
 *   DEFAULT_RODATA
 *   DEFAULT_DATA
 *   DEFAULT_IDATA
 *   DEFAULT_BSS
 *   DEFAULT_STACK
 *
 *   DEFAULT_STACK_SIZE  GNAT: size of the stack
 *
 * This script exports following symbols to be used by startup code:
 *   _sdata    start of the preinitialized data (in RAM)
 *   _edata    end of the preinitialized data (in RAM)
 *   _sidata   start of the preinitialized data secrion in ROM
 *   _sbss     start of the uninitialized data (in RAM)
 *   _ebss     start of the uninitialized data (in RAM)
 *   _estack   address of the initial stack pointer
 *
 *  __stack_start  GNAT: start address of the stack
 *  __stack_end    GNAT: end address of the stack
 */

ENTRY(Reset_Handler)

SECTIONS
{
    /* Events vector is composed from the exceptions vector of the CPU and
       the interrupts vector of the MCU, they are declared in the different
       sections */
    .vectors :
    {
        KEEP(*(.vectors))
    } > DEFAULT_VECTORS

    .text :
    {
        *(.text .text.*)
        *(.itcm.text .itcm.text.*)
    } > DEFAULT_TEXT

    .rodata :
    {
        *(.rodata .rodata.*)
    } > DEFAULT_RODATA

    .data : ALIGN(4)  /* Ensure that the start of the section is word aligned */
    {
        _sdata = .;       /* Global symbol at data start */

        *(.data .data.*)
        *(.dtcm.data .dtcm.data.*)

        . = ALIGN(4);     /* Ensure that the end of the section is word aligned */
        _edata = .;       /* Global symbol at data end */
    } > DEFAULT_DATA AT > DEFAULT_IDATA
    _sidata = LOADADDR(.data);

    .bss (NOLOAD) : ALIGN(4)  /* Ensure that the start of the section is word aligned */
    {
        _sbss = .;        /* Global symbol at bss start */

        *(.bss .bss.*)
        *(.dtcm.bss .dtcm.bss.*)

        . = ALIGN(4);     /* Ensure that the end of the section is word aligned */
        _ebss = .;        /* Global symbol at bss end */

	/* GNAT: per CPU interrupt stack(s) */
        . = ALIGN(0x8);
        __interrupt_stack_start = .;
        *(.noinit.interrupt_stacks)
        . = ALIGN(0x8);
        __interrupt_stack_end = .;

	/* GNAT: application stack */
        . = ALIGN(0x8);
        __stack_start = .;
        . += DEFAULT_STACK_SIZE;
        . = ALIGN(0x8);
        __stack_end = .;
    } > DEFAULT_BSS
}
