--
--  Copyright (C) 2024, Vadim Godunko <vgodunko@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
--

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2022;

with System.Storage_Elements;

with A0B.Types;

package A0B.ARMv7M.SCS.SYST
  with Preelaborate
is

   type SYST_CALIB_Register is record
      TENMS          : A0B.Types.Unsigned_24;
      Reserved_24_29 : A0B.Types.Reserved_6;
      SKEW           : Boolean;
      NOREF          : Boolean;
   end record with Object_Size => 32;

   for SYST_CALIB_Register use record
      TENMS          at 0 range 0 .. 23;
      Reserved_24_29 at 0 range 24 .. 29;
      SKEW           at 0 range 30 .. 30;
      NOREF          at 0 range 31 .. 31;
   end record;

   type SYST_CSR_Register is record
      ENABLE         : Boolean := False;
      TICKINT        : Boolean := False;
      CLKSOURCE      : Boolean := False;
      Reserved_3_15  : A0B.Types.Reserved_13;
      COUNTFLAG      : Boolean := False;
      Reserved_17_31 : A0B.Types.Reserved_15;
   end record with Object_Size => 32;

   for SYST_CSR_Register use record
      ENABLE         at 0 range 0 .. 0;
      TICKINT        at 0 range 1 .. 1;
      CLKSOURCE      at 0 range 2 .. 2;
      Reserved_3_15  at 0 range 3 .. 15;
      COUNTFLAG      at 0 range 16 .. 16;
      Reserved_17_31 at 0 range 17 .. 31;
   end record;

   type SYST_CVR_Register is record
      CURRENT : A0B.Types.Unsigned_32;
   end record with Object_Size => 32;

   type SYST_RVR_Register is record
      RELOAD         : A0B.Types.Unsigned_24 := 0;
      Reserved_24_31 : A0B.Types.Reserved_8;
   end record with Object_Size => 32;

   for SYST_RVR_Register use record
      RELOAD         at 0 range 0 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   SYST_CSR   : SYST_CSR_Register
     with Import,
          Volatile,
          Full_Access_Only,
          Address => System.Storage_Elements.To_Address (16#E000_E010#);
   --  SysTick Control and Status Register

   SYST_RVR   : SYST_RVR_Register
     with Import,
          Volatile,
          Full_Access_Only,
          Address => System.Storage_Elements.To_Address (16#E000_E014#);
   --  SysTick Reload Value Register

   SYST_CVR   : SYST_CVR_Register
     with Import,
          Volatile,
          Full_Access_Only,
          Address => System.Storage_Elements.To_Address (16#E000_E018#);
   --  SysTick Current Value Register

   SYST_CALIB : SYST_CALIB_Register
     with Import,
          Volatile,
          Full_Access_Only,
          Address => System.Storage_Elements.To_Address (16#E000_E01C#);
   --  SysTick Calibration value Register

end A0B.ARMv7M.SCS.SYST;
