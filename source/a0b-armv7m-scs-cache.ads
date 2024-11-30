--
--  Copyright (C) 2024, Vadim Godunko <vgodunko@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
--

pragma Ada_2022;

with System.Storage_Elements;

with A0B.Types;

package A0B.ARMv7M.SCS.Cache
  with Preelaborate, No_Elaboration_Code_All
is

   --  0xE000EF58 ICIMVAU WOI-cache invalidate by MVA to PoUaAddress
   --  0xE000EF64 DCCMVAU WOD-cache clean by MVA to PoUAddress
   --
   --  0xE000EF6C DCCSW WOD-cache clean by set-waySet/way
   --  0xE000EF74 DCCISW WOD-cache clean and invalidate by set-waySet/way
   --  0xE000EF78 BPIALL WOBranch predictor invalidate allIgnored

   ICIALLU : A0B.Types.Unsigned_32
     with Import,
          Volatile,
          Full_Access_Only,
          Address => System.Storage_Elements.To_Address (16#E000_EF50#);
   --  I-cache invalidate all to PoU

   DCIMVAC : System.Storage_Elements.Integer_Address
     with Import,
          Volatile,
          Full_Access_Only,
          Address => System.Storage_Elements.To_Address (16#E000_EF5C#);
   --  D-cache invalidate by MVA to PoC

   DCISW   : A0B.Types.Unsigned_32
     with Import,
          Volatile,
          Full_Access_Only,
          Address => System.Storage_Elements.To_Address (16#E000_EF60#);
   --  D-cache invalidate by set-way
   --  XXX This register has "dynamic" strusture.

   DCCMVAC : System.Storage_Elements.Integer_Address
     with Import,
          Volatile,
          Full_Access_Only,
          Address => System.Storage_Elements.To_Address (16#E000_EF68#);
   --  D-cache clean by MVA to PoC

   DCCIMVAC : System.Storage_Elements.Integer_Address
     with Import,
          Volatile,
          Full_Access_Only,
          Address => System.Storage_Elements.To_Address (16#E000_EF70#);
   --  D-cache clean and invalidate by MVA to PoC

end A0B.ARMv7M.SCS.Cache;
