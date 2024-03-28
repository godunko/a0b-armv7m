--
--  Copyright (C) 2024, Vadim Godunko <vgodunko@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
--

--  Various subprograms provided by CMSIS

pragma Restrictions (No_Elaboration_Code);

with System;

with A0B.Types;

package A0B.ARMv7M.CMSIS
  with Preelaborate
is

   procedure Wait_For_Interrupt with Inline_Always;
   --  Wait For Interrupt
   --
   --  Wait For Interrupt is a hint instruction that suspends execution until
   --  one of a number of events occurs.

   procedure Wait_For_Event with Inline_Always;
   --  Wait For Event
   --
   --  Wait For Event is a hint instruction that permits the processor to
   --  enter a low-power state until one of a number of events occurs.

   procedure Data_Synchronization_Barrier with Inline_Always;
   --  Data Synchronization Barrier
   --
   --  Acts as a special kind of Data Memory Barrier. It completes when all
   --  explicit memory accesses before this instruction complete.

   procedure Instruction_Synchronization_Barrier with Inline_Always;
   --  Instruction Synchronization Barrier
   --
   --  Instruction Synchronization Barrier flushes the pipeline in the
   --  processor, so that all instructions following the ISB are fetched from
   --  cache or memory, after the instruction has been completed.

   procedure Enable_Interrupts with Inline_Always;
   --  Enable IRQ Interrupts
   --
   --  Enables IRQ interrupts by clearing the I-bit in the CPSR.
   --  Can only be executed in Privileged modes.

   procedure Disable_Interrupts with Inline_Always;
   --  Disable IRQ Interrupts
   --
   --  Disables IRQ interrupts by setting the I-bit in the CPSR.
   --  Can only be executed in Privileged modes.

   procedure Enable_Faults with Inline_Always;
   --  Enable FIQ
   --
   --  Enables FIQ interrupts by clearing the F-bit in the CPSR.
   --  Can only be executed in Privileged modes.

   procedure Disable_Faults with Inline_Always;
   --  Disable FIQ
   --
   --  Disables FIQ interrupts by setting the F-bit in the CPSR.
   --  Can only be executed in Privileged modes.

   type CONTROL_Register is record
      nPRIV         : Boolean;
      SPSEL         : Boolean;
      FPCA          : Boolean;
      Reserved_3_31 : A0B.Types.Reserved_29;
   end record with Object_Size => 32;

   for CONTROL_Register use record
      nPRIV         at 0 range 0 .. 0;
      SPSEL         at 0 range 1 .. 1;
      FPCA          at 0 range 2 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   function Get_CONTROL return CONTROL_Register with Inline_Always;
   --  Get Control Register
   --
   --  Returns the content of the Control Register.

   procedure Set_CONTROL (To : CONTROL_Register) with Inline_Always;
   --  Set Control Register
   --
   --  Writes the given value to the Control Register.
   --
   --  Instruction_Synchronization_Barrier should be called after change of
   --  the value of the CONTROL register.

   function Get_BASEPRI return A0B.ARMv7M.Priority_Value with Inline_Always;
   --  Get Base Priority
   --
   --  Returns the current value of the Base Priority register.
   --
   --  XXX Note, GCC 13.2 fails to compile code when register is represented
   --  as record like other registers.

   procedure Set_BASEPRI (To : A0B.ARMv7M.Priority_Value) with Inline_Always;
   --  Set Base Priority
   --
   --  Assigns the given value to the Base Priority register.
   --
   --  XXX Note, GCC 13.2 fails to compile code when register is represented
   --  as record like other registers.

   function Get_MSP return System.Address with Inline_Always;
   --  Get Main Stack Pointer
   --
   --  Returns the current value of the Main Stack Pointer (MSP).

   procedure Set_MSP (To : System.Address) with Inline_Always;
   --  Set Main Stack Pointer
   --
   --  Assigns the given value to the Main Stack Pointer (MSP).

   function Get_PSP return System.Address with Inline_Always;
   --  Get Process Stack Pointer
   --
   --  Returns the current value of the Process Stack Pointer (PSP).

   procedure Set_PSP (To : System.Address) with Inline_Always;
   --  Set Process Stack Pointer
   --
   --  Assigns the given value to the Process Stack Pointer (PSP).

end A0B.ARMv7M.CMSIS;
