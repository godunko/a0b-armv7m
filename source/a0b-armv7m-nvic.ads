--
--  Copyright (C) 2024, Vadim Godunko <vgodunko@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
--

pragma Restrictions (No_Elaboration_Code);

pragma Ada_2022;

with System.Storage_Elements;

with A0B.Types;

package A0B.ARMv7M.NVIC
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

--     type NVIC_Registers is record
--        ISER : ISER_Register with Volatile;
--        ICER : ICER_Register with Volatile;
--        ISPR : ISPR_Register with Volatile;
--        ICPR : ICPR_Register with Volatile;
--        IABR : IABR_Register with Volatile;
--        IPR  : IPR_Register with Volatile;
--     end record;

--     for NVIC_Registers use record
--        ISER at 16#000# range 0 .. 495;
--        ICER at 16#080# range 0 .. 495;
--        ISPR at 16#100# range 0 .. 495;
--        ICPR at 16#180# range 0 .. 495;
--        IABR at 16#200# range 0 .. 495;
--        IPR  at 16#300# range 0 .. 3_967;
--     end record;

--     NVIC_Base : constant System.Address :=
--       System.Storage_Elements.To_Address (16#E000_E100#);

--     NVIC : NVIC_Registers with Import, Address => NVIC_Base;

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

end A0B.ARMv7M.NVIC;