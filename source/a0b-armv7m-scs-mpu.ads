--
--  Copyright (C) 2024, Vadim Godunko <vgodunko@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
--

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2022;

with System.Storage_Elements;

with A0B.Types;

package A0B.ARMv7M.SCS.MPU
  with Preelaborate
is

   type MPU_CTRL_Register is record
      ENABLE        : Boolean;
      HFNMIENA      : Boolean;
      PRIVDEFENA    : Boolean;
      Reserved_3_31 : A0B.Types.Reserved_29;
   end record with Object_Size => 32;

   for MPU_CTRL_Register use record
      ENABLE        at 0 range 0 .. 0;
      HFNMIENA      at 0 range 1 .. 1;
      PRIVDEFENA    at 0 range 2 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   type MPU_RASR_Register is record
      ENABLE         : Boolean;
      SIZE           : A0B.Types.Unsigned_5;
      Reserved_6_7   : A0B.Types.Reserved_2;
      SRD            : A0B.Types.Unsigned_8;  --  array of Boolean?
      B              : Boolean;
      C              : Boolean;
      S              : Boolean;
      TEX            : A0B.Types.Unsigned_3;
      Reserved_22_23 : A0B.Types.Reserved_2;
      AP             : A0B.Types.Unsigned_3;
      Reserved_27    : A0B.Types.Reserved_1;
      XN             : Boolean;
      Reserved_29_31 : A0B.Types.Reserved_3;
   end record with Object_Size => 32;

   for MPU_RASR_Register use record
      ENABLE         at 0 range 0 .. 0;
      SIZE           at 0 range 1 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      SRD            at 0 range 8 .. 15;
      B              at 0 range 16 .. 16;
      C              at 0 range 17 .. 17;
      S              at 0 range 18 .. 18;
      TEX            at 0 range 19 .. 21;
      Reserved_22_23 at 0 range 22 .. 23;
      AP             at 0 range 24 .. 26;
      Reserved_27    at 0 range 27 .. 27;
      XN             at 0 range 28 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   type MPU_RBAR_Register is record
      --  REGION : A0B.Types.Unsigned_4;
      --  VALID  : Boolean;
      ADDR : System.Address;
   end record with Object_Size => 32;

   for MPU_RBAR_Register use record
      --  REGION at 0 range 0 .. 3;
      --  VALID  at 0 range 4 .. 4;
      ADDR at 0 range 0 .. 31;  --  5 .. 31;
   end record;

   type MPU_RNR_Register is record
      REGION        : A0B.Types.Unsigned_8  := 0;
      Reserved_8_31 : A0B.Types.Unsigned_24 := 0;
   end record with Object_Size => 32;

   for MPU_RNR_Register use record
      REGION        at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   --     MPU_TYPE    : A0B.Types.Unsigned_32;
   --    with Import,
   --         Volatile,
   --         Full_Access_Only,
   --         Address => System.Storage_Elements.To_Address (16#E000_ED90#);
   --  MPU Type Register

   MPU_CTRL    : MPU_CTRL_Register
     with Import,
          Volatile,
          Full_Access_Only,
          Address => System.Storage_Elements.To_Address (16#E000_ED94#);
   --  MPU Control Register

   MPU_RNR     : MPU_RNR_Register
     with Import,
          Volatile,
          Full_Access_Only,
          Address => System.Storage_Elements.To_Address (16#E000_ED98#);
   --  MPU Region Number Register

   MPU_RBAR    : MPU_RBAR_Register
     with Import,
          Volatile,
          Full_Access_Only,
          Address => System.Storage_Elements.To_Address (16#E000_ED9C#);
   --  MPU Region Base Address Register

   MPU_RASR    : MPU_RASR_Register
     with Import,
          Volatile,
          Full_Access_Only,
          Address => System.Storage_Elements.To_Address (16#E000_EDA0#);
   --  MPU Region Attribute and Size Register

   --     MPU_RBAR_A1 : A0B.Types.Unsigned_32;
   --    with Import,
   --         Volatile,
   --         Full_Access_Only,
   --         Address => System.Storage_Elements.To_Address (16#E000_EDA4#);
   --  Alias 1 of MPU_RBAR

   --     MPU_RASR_A1 : A0B.Types.Unsigned_32;
   --    with Import,
   --         Volatile,
   --         Full_Access_Only,
   --         Address => System.Storage_Elements.To_Address (16#E000_EDA8#);
   --  Alias 1 of MPU_RASR

   --     MPU_RBAR_A2 : A0B.Types.Unsigned_32;
   --    with Import,
   --         Volatile,
   --         Full_Access_Only,
   --         Address => System.Storage_Elements.To_Address (16#E000_EDAC#);
   --  Alias 2 of MPU_RBAR

   --     MPU_RASR_A2 : A0B.Types.Unsigned_32;
   --    with Import,
   --         Volatile,
   --         Full_Access_Only,
   --         Address => System.Storage_Elements.To_Address (16#E000_EDB0#);
   --  Alias 2 of MPU_RASR

   --     MPU_RBAR_A3 : A0B.Types.Unsigned_32;
   --    with Import,
   --         Volatile,
   --         Full_Access_Only,
   --         Address => System.Storage_Elements.To_Address (16#E000_EDB4#);
   --  Alias 3 of MPU_RBAR

   --     MPU_RASR_A3 : A0B.Types.Unsigned_32;
   --    with Import,
   --         Volatile,
   --         Full_Access_Only,
   --         Address => System.Storage_Elements.To_Address (16#E000_EDB8#);
   --  Alias 3 of MPU_RASR

end A0B.ARMv7M.SCS.MPU;
