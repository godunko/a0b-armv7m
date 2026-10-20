--
--  Copyright (C) 2024-2026, Vadim Godunko <vgodunko@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
--

pragma Ada_2022;

with System.Storage_Elements;

with A0B.Types;

package A0B.ARMv7M.SCS.DWT
  with Preelaborate, No_Elaboration_Code_All
is

   type DWT_CTRL_Register is record
      CYCCNTENA      : Boolean;
      POSTPRESET     : A0B.Types.Unsigned_4;
      POSTINIT       : A0B.Types.Unsigned_4;
      CYCTAP         : Boolean;
      SYNCTAP        : A0B.Types.Unsigned_2;
      PCSAMPLENA     : Boolean;
      Reserved_13_15 : A0B.Types.Reserved_3;
      EXCTRCENA      : Boolean;
      CPIEVTENA      : Boolean;
      EXCEVTENA      : Boolean;
      SLEEPEVTENA    : Boolean;
      LSUEVTENA      : Boolean;
      FOLDEVTENA     : Boolean;
      CYCEVTENA      : Boolean;
      Reserved_23    : A0B.Types.Reserved_1;
      NOPRFCNT       : Boolean;
      NOCYCCNT       : Boolean;
      NOEXTTRIG      : Boolean;
      NOTRCPKT       : Boolean;
      NUMCOMP        : A0B.Types.Unsigned_4;
   end record with Object_Size => 32;

   for DWT_CTRL_Register use record
      CYCCNTENA      at 0 range 0 .. 0;
      POSTPRESET     at 0 range 1 .. 4;
      POSTINIT       at 0 range 5 .. 8;
      CYCTAP         at 0 range 9 .. 9;
      SYNCTAP        at 0 range 10 .. 11;
      PCSAMPLENA     at 0 range 12 .. 12;
      Reserved_13_15 at 0 range 13 .. 15;
      EXCTRCENA      at 0 range 16 .. 16;
      CPIEVTENA      at 0 range 17 .. 17;
      EXCEVTENA      at 0 range 18 .. 18;
      SLEEPEVTENA    at 0 range 19 .. 19;
      LSUEVTENA      at 0 range 20 .. 20;
      FOLDEVTENA     at 0 range 21 .. 21;
      CYCEVTENA      at 0 range 22 .. 22;
      Reserved_23    at 0 range 23 .. 23;
      NOPRFCNT       at 0 range 24 .. 24;
      NOCYCCNT       at 0 range 25 .. 25;
      NOEXTTRIG      at 0 range 26 .. 26;
      NOTRCPKT       at 0 range 27 .. 27;
      NUMCOMP        at 0 range 28 .. 31;
   end record;

   type DWT_CYCCNT_Register is record
      CYCCNT : A0B.Types.Unsigned_32;
   end record with Object_Size => 32;

   for DWT_CYCCNT_Register use record
      CYCCNT at 0 range 0 .. 31;
   end record;

   type DWT_CPICNT_Register is record
      CPICNT        : A0B.Types.Unsigned_8;
      Reserved_8_31 : A0B.Types.Reserved_24;
   end record with Object_Size => 32;

   for DWT_CPICNT_Register use record
      CPICNT        at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   type DWT_EXCCNT_Register is record
      EXCCNT        : A0B.Types.Unsigned_8;
      Reserved_8_31 : A0B.Types.Reserved_24;
   end record with Object_Size => 32;

   for DWT_EXCCNT_Register use record
      EXCCNT        at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   type DWT_SLEEPCNT_Register is record
      SLEEPCNT      : A0B.Types.Unsigned_8;
      Reserved_8_31 : A0B.Types.Reserved_24;
   end record with Object_Size => 32;

   for DWT_SLEEPCNT_Register use record
      SLEEPCNT      at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   type DWT_LSUCNT_Register is record
      LSUCNT        : A0B.Types.Unsigned_8;
      Reserved_8_31 : A0B.Types.Reserved_24;
   end record with Object_Size => 32;

   for DWT_LSUCNT_Register use record
      LSUCNT        at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   type DWT_FOLDCNT_Register is record
      FOLDCNT       : A0B.Types.Unsigned_8;
      Reserved_8_31 : A0B.Types.Reserved_24;
   end record with Object_Size => 32;

   for DWT_FOLDCNT_Register use record
      FOLDCNT       at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   type DWT_PCSR_Register is record
      EIASAMPLE : A0B.Types.Unsigned_32;
   end record with Object_Size => 32;

   for DWT_PCSR_Register use record
      EIASAMPLE at 0 range 0 .. 31;
   end record;

   type DWT_COMPn_Register is record
      COMP : A0B.Types.Unsigned_32;
   end record with Object_Size => 32;

   for DWT_COMPn_Register use record
      COMP at 0 range 0 .. 31;
   end record;

   type DWT_MASKn_Register is record
      Reserved_31_5 : A0B.Types.Reserved_27;
      MASK          : A0B.Types.Unsigned_5;
   end record with Object_Size => 32;

   for DWT_MASKn_Register use record
      MASK          at 0 range 0 .. 4;
      Reserved_31_5 at 0 range 5 .. 31;
   end record;

   type DWT_FUNCTIONn_Register is record
      Reserved_31_25 : A0B.Types.Reserved_7;
      MATCHED        : Boolean;
      Reserved_23_20 : A0B.Types.Reserved_4;
      DATAVADDR1     : A0B.Types.Unsigned_4;
      DATAVADDR0     : A0B.Types.Unsigned_4;
      DATAVSIZE      : A0B.Types.Unsigned_2;
      LNK1ENA        : Boolean;
      DATAVMATCH     : Boolean;
      CYCMATCH       : Boolean;
      Reserved_6_6   : A0B.Types.Reserved_1;
      EMITRANGE      : Boolean;
      Reserved_4_4   : A0B.Types.Reserved_1;
      FUNCTIONC      : A0B.Types.Unsigned_4;
   end record with Object_Size => 32;

   for DWT_FUNCTIONn_Register use record
      FUNCTIONC      at 0 range 0 .. 3;
      Reserved_4_4   at 0 range 4 .. 4;
      EMITRANGE      at 0 range 5 .. 5;
      Reserved_6_6   at 0 range 6 .. 6;
      CYCMATCH       at 0 range 7 .. 7;
      DATAVMATCH     at 0 range 8 .. 8;
      LNK1ENA        at 0 range 9 .. 9;
      DATAVSIZE      at 0 range 10 .. 11;
      DATAVADDR0     at 0 range 12 .. 15;
      DATAVADDR1     at 0 range 16 .. 19;
      Reserved_23_20 at 0 range 20 .. 23;
      MATCHED        at 0 range 24 .. 24;
      Reserved_31_25 at 0 range 25 .. 31;
   end record;

   type DWT_COMPARATOR_Registers is record
      DWT_COMPn     : DWT_COMPn_Register     with Volatile, Full_Access_Only;
      DWT_MASKn     : DWT_MASKn_Register     with Volatile, Full_Access_Only;
      DWT_FUNCTIONn : DWT_FUNCTIONn_Register with Volatile, Full_Access_Only;
      Reserved      : A0B.Types.Unsigned_32  with Volatile, Full_Access_Only;
   end record with Object_Size => 128;

   for DWT_COMPARATOR_Registers use record
      DWT_COMPn     at 0 range 0 .. 31;
      DWT_MASKn     at 4 range 0 .. 31;
      DWT_FUNCTIONn at 8 range 0 .. 31;
      Reserved      at 12 range 0 .. 31;
   end record;

   DWT_CTRL     : DWT_CTRL_Register
     with Import,
          Volatile,
          Full_Access_Only,
          Address => System.Storage_Elements.To_Address (16#E000_1000#);
   DWT_CYCCNT   : DWT_CYCCNT_Register
     with Import,
          Volatile,
          Full_Access_Only,
          Address => System.Storage_Elements.To_Address (16#E000_1004#);
   DWT_CPICNT   : DWT_CPICNT_Register
     with Import,
          Volatile,
          Full_Access_Only,
          Address => System.Storage_Elements.To_Address (16#E000_1008#);
   DWT_EXCCNT   : DWT_EXCCNT_Register
     with Import,
          Volatile,
          Full_Access_Only,
          Address => System.Storage_Elements.To_Address (16#E000_100C#);
   DWT_SLEEPCNT : DWT_SLEEPCNT_Register
     with Import,
          Volatile,
          Full_Access_Only,
          Address => System.Storage_Elements.To_Address (16#E000_1010#);
   DWT_LSUCNT   : DWT_LSUCNT_Register
     with Import,
          Volatile,
          Full_Access_Only,
          Address => System.Storage_Elements.To_Address (16#E000_1014#);
   DWT_FOLDCNT  : DWT_FOLDCNT_Register
     with Import,
          Volatile,
          Full_Access_Only,
          Address => System.Storage_Elements.To_Address (16#E000_1018#);
   DWT_PCSR     : DWT_PCSR_Register
     with Import,
          Volatile,
          Full_Access_Only,
          Address => System.Storage_Elements.To_Address (16#E000_101C#);

   DWT_COMPARATOR : array (A0B.Types.Unsigned_4) of DWT_COMPARATOR_Registers
     with Import,
          Address => System.Storage_Elements.To_Address (16#E000_1020#);

end A0B.ARMv7M.SCS.DWT;
