--
--  Copyright (C) 2026, Vadim Godunko <vgodunko@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
--

pragma Ada_2022;

with System.Storage_Elements;

with A0B.Types;

package A0B.ARMv7M.SCS.DCB
  with Preelaborate, No_Elaboration_Code_All
is

   type DEMCR_Register is record
      Reserved_31_25 : A0B.Types.Reserved_7;
      TRCENA         : Boolean;
      Reserved_23_20 : A0B.Types.Reserved_4;
      MON_REQ        : Boolean;
      MON_STEP       : Boolean;
      MON_PEND       : Boolean;
      MON_EN         : Boolean;
      Reserved_15_11 : A0B.Types.Reserved_5;
      VC_HARDERR     : Boolean;
      VC_INTERR      : Boolean;
      VC_BUSERR      : Boolean;
      VC_STATERR     : Boolean;
      VC_CHKERR      : Boolean;
      VC_NOCPERR     : Boolean;
      VC_MMERR       : Boolean;
      Reserved_3_1   : A0B.Types.Reserved_3;
      VC_CORERESET   : Boolean;
   end record with Object_Size => 32;

   for DEMCR_Register use record
      VC_CORERESET   at 0 range 0 .. 0;
      Reserved_3_1   at 0 range 1 .. 3;
      VC_MMERR       at 0 range 4 .. 4;
      VC_NOCPERR     at 0 range 5 .. 5;
      VC_CHKERR      at 0 range 6 .. 6;
      VC_STATERR     at 0 range 7 .. 7;
      VC_BUSERR      at 0 range 8 .. 8;
      VC_INTERR      at 0 range 9 .. 9;
      VC_HARDERR     at 0 range 10 .. 10;
      Reserved_15_11 at 0 range 11 .. 15;
      MON_EN         at 0 range 16 .. 16;
      MON_PEND       at 0 range 17 .. 17;
      MON_STEP       at 0 range 18 .. 18;
      MON_REQ        at 0 range 19 .. 19;
      Reserved_23_20 at 0 range 20 .. 23;
      TRCENA         at 0 range 24 .. 24;
      Reserved_31_25 at 0 range 25 .. 31;
   end record;

   DEMCR : DEMCR_Register
     with Import,
          Volatile,
          Full_Access_Only,
          Address => System.Storage_Elements.To_Address (16#E000_EDFC#);

end A0B.ARMv7M.SCS.DCB;
