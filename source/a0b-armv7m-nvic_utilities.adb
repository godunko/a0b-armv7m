--
--  Copyright (C) 2024, Vadim Godunko <vgodunko@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
--

pragma Restrictions (No_Elaboration_Code);

pragma Ada_2022;

with A0B.ARMv7M.SCS.NVIC; use A0B.ARMv7M.SCS.NVIC;
with A0B.Types;

package body A0B.ARMv7M.NVIC_Utilities is

   use type A0B.Types.Unsigned_32;

   type Word is new A0B.Types.Unsigned_32
     with Volatile, Full_Access_Only;

   type NVIC_Register_Set is
     array (A0B.Types.Unsigned_32 range 0 .. 15) of Word
       with Size => 512;
   --  Layout of the set of NVIC registers

   -------------------
   -- Clear_Pending --
   -------------------

   procedure Clear_Pending (Interrupt : External_Interrupt_Number) is
      Index : constant A0B.Types.Unsigned_32 :=
        A0B.Types.Unsigned_32 (Interrupt) / 32;
      Bit   : constant A0B.Types.Unsigned_32 :=
        A0B.Types.Unsigned_32 (Interrupt) mod 32;
      Mask  : constant A0B.Types.Unsigned_32 :=
        A0B.Types.Shift_Left (1, Integer (Bit));

      ICPR  : NVIC_Register_Set
        with Import, Convention => Ada,
             Address => A0B.ARMv7M.SCS.NVIC.ICPR'Address;

   begin
      ICPR (Index) := Word (Mask);
   end Clear_Pending;

   -----------------------
   -- Disable_Interrupt --
   -----------------------

   procedure Disable_Interrupt (Interrupt : External_Interrupt_Number) is
      Index : constant A0B.Types.Unsigned_32 :=
        A0B.Types.Unsigned_32 (Interrupt) / 32;
      Bit   : constant A0B.Types.Unsigned_32 :=
        A0B.Types.Unsigned_32 (Interrupt) mod 32;
      Mask  : constant A0B.Types.Unsigned_32 :=
        A0B.Types.Shift_Left (1, Integer (Bit));

      ICER  : NVIC_Register_Set
        with Import, Convention => Ada,
             Address => A0B.ARMv7M.SCS.NVIC.ICER'Address;

   begin
      ICER (Index) := Word (Mask);
   end Disable_Interrupt;

   ----------------------
   -- Enable_Interrupt --
   ----------------------

   procedure Enable_Interrupt (Interrupt : External_Interrupt_Number) is
      Index : constant A0B.Types.Unsigned_32 :=
        A0B.Types.Unsigned_32 (Interrupt) / 32;
      Bit   : constant A0B.Types.Unsigned_32 :=
        A0B.Types.Unsigned_32 (Interrupt) mod 32;
      Mask  : constant A0B.Types.Unsigned_32 :=
        A0B.Types.Shift_Left (1, Integer (Bit));

      ISER  : NVIC_Register_Set
        with Import, Convention => Ada,
             Address => A0B.ARMv7M.SCS.NVIC.ISER'Address;

   begin
      ISER (Index) := Word (Mask);
   end Enable_Interrupt;

   ------------------
   -- Get_Priority --
   ------------------

   function Get_Priority
     (Interrupt : External_Interrupt_Number) return Priority_Value is
   begin
      return IPR (Interrupt);
   end Get_Priority;

   -----------------
   -- Set_Pending --
   -----------------

   procedure Set_Pending (Interrupt : External_Interrupt_Number) is
      Index : constant A0B.Types.Unsigned_32 :=
        A0B.Types.Unsigned_32 (Interrupt) / 32;
      Bit   : constant A0B.Types.Unsigned_32 :=
        A0B.Types.Unsigned_32 (Interrupt) mod 32;
      Mask  : constant A0B.Types.Unsigned_32 :=
        A0B.Types.Shift_Left (1, Integer (Bit));

      ISPR  : NVIC_Register_Set
        with Import, Convention => Ada,
             Address => A0B.ARMv7M.SCS.NVIC.ISPR'Address;

   begin
      ISPR (Index) := Word (Mask);
   end Set_Pending;

   ------------------
   -- Set_Priority --
   ------------------

   procedure Set_Priority
     (Interrupt : External_Interrupt_Number;
      Priority  : Priority_Value) is
   begin
      IPR (Interrupt) := Priority;
   end Set_Priority;

end A0B.ARMv7M.NVIC_Utilities;
