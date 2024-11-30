--
--  Copyright (C) 2024, Vadim Godunko <vgodunko@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
--

pragma Ada_2022;

with System.Storage_Elements;

with A0B.Types;

package A0B.ARMv7M.SCS.FP
  with Preelaborate, No_Elaboration_Code_All
is

   type SCB_FPCCR_Register is record
      LSPACT        : Boolean := False;
      USER          : Boolean := False;
      Reserved_2_2  : A0B.Types.Reserved_1;
      THREAD        : Boolean := False;
      HFRDY         : Boolean := False;
      MMRDY         : Boolean := False;
      BFRDY         : Boolean := False;
      Reserved_7_7  : A0B.Types.Reserved_1;
      MONRDY        : Boolean := False;
      Reserved_9_29 : A0B.Types.Reserved_21;
      LSPEN         : Boolean := False;
      ASPEN         : Boolean := False;
   end record with Object_Size => 32;

   for SCB_FPCCR_Register use record
      LSPACT        at 0 range 0 .. 0;
      USER          at 0 range 1 .. 1;
      Reserved_2_2  at 0 range 2 .. 2;
      THREAD        at 0 range 3 .. 3;
      HFRDY         at 0 range 4 .. 4;
      MMRDY         at 0 range 5 .. 5;
      BFRDY         at 0 range 6 .. 6;
      Reserved_7_7  at 0 range 7 .. 7;
      MONRDY        at 0 range 8 .. 8;
      Reserved_9_29 at 0 range 9 .. 29;
      LSPEN         at 0 range 30 .. 30;
      ASPEN         at 0 range 31 .. 31;
   end record;

   type SCB_MVFR0_Register is record
      A_SIMD                : A0B.Types.Unsigned_4;
      Single_Precision      : A0B.Types.Unsigned_4;
      Double_Precision      : A0B.Types.Unsigned_4;
      FP_Exception_Trapping : A0B.Types.Unsigned_4;
      Divide                : A0B.Types.Unsigned_4;
      Square_Root           : A0B.Types.Unsigned_4;
      Short_Vectors         : A0B.Types.Unsigned_4;
      FP_Rounding_Modes     : A0B.Types.Unsigned_4;
   end record with Object_Size => 32;

   for SCB_MVFR0_Register use record
      A_SIMD                at 0 range 0 .. 3;
      Single_Precision      at 0 range 4 .. 7;
      Double_Precision      at 0 range 8 .. 11;
      FP_Exception_Trapping at 0 range 12 .. 15;
      Divide                at 0 range 16 .. 19;
      Square_Root           at 0 range 20 .. 23;
      Short_Vectors         at 0 range 24 .. 27;
      FP_Rounding_Modes     at 0 range 28 .. 31;
   end record;

   FPCCR  : SCB_FPCCR_Register
     with Import,
          Volatile,
          Full_Access_Only,
          Address => System.Storage_Elements.To_Address (16#E000_EF34#);
   --  Floating Point Context Control Register

   FPCAR  : System.Storage_Elements.Integer_Address
     with Import,
          Volatile,
          Full_Access_Only,
          Address => System.Storage_Elements.To_Address (16#E000_EF38#);
   --  Floating Point Context Address Register

   --  FPDSCR :
   --    with Import,
   --         Volatile,
   --         Full_Access_Only,
   --         Address => System.Storage_Elements.To_Address (16#E000_EF3C#);
   --  Floating Point Default Status Control Register

   MVFR0  : SCB_MVFR0_Register
     with Import,
          Volatile,
          Full_Access_Only,
          Address => System.Storage_Elements.To_Address (16#E000_EF40#);
   --  Media and FP Feature Register 0

   --  MVFR1  :
   --    with Import,
   --         Volatile,
   --         Full_Access_Only,
   --         Address => System.Storage_Elements.To_Address (16#E000_EF44#);
   --  Media and FP Feature Register 1

   --  MVFR2  :
   --    with Import,
   --         Volatile,
   --         Full_Access_Only,
   --         Address => System.Storage_Elements.To_Address (16#E000_EF48#);
   --  Media and FP Feature Register 2

end A0B.ARMv7M.SCS.FP;
