--
--  Copyright (C) 2024, Vadim Godunko <vgodunko@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
--

--  Various subprograms provided by CMSIS

pragma Restrictions (No_Elaboration_Code);

with System;

with A0B.Types;

package A0B.ARMv7M.CMSIS is

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

   function Get_MSP return System.Address with Inline_Always;
   --  Get Main Stack Pointer
   --
   --  Returns the current value of the Main Stack Pointer (MSP).

   procedure Set_MSP (To : System.Address) with Inline_Always;
   --  Set Main Stack Pointer
   --
   --  Assigns the given value to the Main Stack Pointer (MSP).

end A0B.ARMv7M.CMSIS;