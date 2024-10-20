--
--  Copyright (C) 2024, Vadim Godunko <vgodunko@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
--

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2022;

with System.Storage_Elements;

with A0B.Types;

package A0B.ARMv7M.SCS.NVIC
  with Preelaborate
is

   type ISER_Register is array (External_Interrupt_Number) of Boolean
     with Pack, Object_Size => 496;

   type ICER_Register is array (External_Interrupt_Number) of Boolean
     with Pack, Object_Size => 496;

   type ISPR_Register is array (External_Interrupt_Number) of Boolean
     with Pack, Object_Size => 496;

   type ICPR_Register is array (External_Interrupt_Number) of Boolean
     with Pack, Object_Size => 496;

   type IABR_Register is array (External_Interrupt_Number) of Boolean
     with Pack, Object_Size => 496;

   type IPR_Register is array (External_Interrupt_Number) of Priority_Value
     with Pack, Object_Size => 3_968;

   type ICTR_Register is record
      INTLINESNUM : A0B.Types.Unsigned_4;
      Reserved    : A0B.Types.Reserved_24;
   end record;

   for ICTR_Register use record
      INTLINESNUM at 0 range 0 .. 3;
      Reserved    at 0 range 4 .. 31;
   end record;

   ICTR : ICTR_Register
     with Volatile,
          Full_Access_Only,
          Address => System.Storage_Elements.To_Address (16#E000_E004#);

   ISER : ISER_Register
     with Volatile,
          Address => System.Storage_Elements.To_Address (16#E000_E100#);
   ICER : ICER_Register
     with Volatile,
          Address => System.Storage_Elements.To_Address (16#E000_E180#);
   ISPR : ISPR_Register
     with Volatile,
          Address => System.Storage_Elements.To_Address (16#E000_E200#);
   ICPR : ICPR_Register
     with Volatile,
          Address => System.Storage_Elements.To_Address (16#E000_E280#);
   IABR : IABR_Register
     with Volatile,
          Address => System.Storage_Elements.To_Address (16#E000_E300#);
   IPR  : IPR_Register
     with Volatile,
          Address => System.Storage_Elements.To_Address (16#E000_E400#);

end A0B.ARMv7M.SCS.NVIC;
