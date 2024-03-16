--
--  Copyright (C) 2024, Vadim Godunko <vgodunko@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
--

pragma Restrictions (No_Elaboration_Code);

with System.Machine_Code;

package body A0B.ARMv7M.CMSIS is

   ----------------------------------
   -- Data_Synchronization_Barrier --
   ----------------------------------

   procedure Data_Synchronization_Barrier is
   begin
      System.Machine_Code.Asm
        (Template => "dsb 0xF",
         Clobber  => "memory",
         Volatile => True);
   end Data_Synchronization_Barrier;

   -----------------
   -- Get_CONTROL --
   -----------------

   function Get_CONTROL return CONTROL_Register is
   begin
      return Result : CONTROL_Register do
         System.Machine_Code.Asm
           (Template => "mrs %0, control",
            Outputs  => CONTROL_Register'Asm_Output ("=r", Result),
            Volatile => True);
      end return;
   end Get_CONTROL;

   -------------
   -- Get_MSP --
   -------------

   function Get_MSP return System.Address is
   begin
      return Result : System.Address do
         System.Machine_Code.Asm
           (Template => "mrs %0, msp",
            Outputs  => System.Address'Asm_Output ("=r", Result),
            Volatile => True);
      end return;
   end Get_MSP;

   -------------
   -- Get_PSP --
   -------------

   function Get_PSP return System.Address is
   begin
      return Result : System.Address do
         System.Machine_Code.Asm
           (Template => "mrs %0, psp",
            Outputs  => System.Address'Asm_Output ("=r", Result),
            Volatile => True);
      end return;
   end Get_PSP;

   -----------------------------------------
   -- Instruction_Synchronization_Barrier --
   -----------------------------------------

   procedure Instruction_Synchronization_Barrier is
   begin
      System.Machine_Code.Asm
        (Template => "isb 0xF",
         Clobber  => "memory",
         Volatile => True);
   end Instruction_Synchronization_Barrier;

   -----------------
   -- Set_CONTROL --
   -----------------

   procedure Set_CONTROL (To : CONTROL_Register) is
   begin
      System.Machine_Code.Asm
        (Template => "msr control, %0",
         Inputs   => CONTROL_Register'Asm_Input ("r", To),
         Clobber  => "memory",
         Volatile => True);
   end Set_CONTROL;

   -------------
   -- Set_MSP --
   -------------

   procedure Set_MSP (To : System.Address) is
   begin
      System.Machine_Code.Asm
        (Template => "msr msp, %0",
         Inputs   => System.Address'Asm_Input ("r", To),
         Clobber  => "memory",
         Volatile => True);
   end Set_MSP;

   -------------
   -- Set_PSP --
   -------------

   procedure Set_PSP (To : System.Address) is
   begin
      System.Machine_Code.Asm
        (Template => "msr psp, %0",
         Inputs   => System.Address'Asm_Input ("r", To),
         Clobber  => "memory",
         Volatile => True);
   end Set_PSP;

end A0B.ARMv7M.CMSIS;