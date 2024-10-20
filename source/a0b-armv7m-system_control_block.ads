--
--  Copyright (C) 2024, Vadim Godunko <vgodunko@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
--

pragma Restrictions (No_Elaboration_Code);

pragma Ada_2022;

with System.Storage_Elements;

with A0B.Types;

package A0B.ARMv7M.System_Control_Block
  with Preelaborate
is

   type BFSR_Register is record
      IBUSERR      : Boolean;
      PRECISERR    : Boolean;
      IMPRECISERR  : Boolean;
      UNSTKERR     : Boolean;
      STKERR       : Boolean;
      LSPERR       : Boolean;
      Reserved_6_6 : A0B.Types.Reserved_1;
      BFARVALID    : Boolean;
   end record with Object_Size => 8;

   for BFSR_Register use record
      IBUSERR      at 0 range 0 .. 0;
      PRECISERR    at 0 range 1 .. 1;
      IMPRECISERR  at 0 range 2 .. 2;
      UNSTKERR     at 0 range 3 .. 3;
      STKERR       at 0 range 4 .. 4;
      LSPERR       at 0 range 5 .. 5;
      Reserved_6_6 at 0 range 6 .. 6;
      BFARVALID    at 0 range 7 .. 7;
   end record;

   type CCR_Register is record
      NONBASETHRDENA : Boolean;
      USERSETMPEND   : Boolean;
      Reserved_2_2   : A0B.Types.Reserved_1;
      UNALIGN_TRP    : Boolean;
      DIV_0_TRP      : Boolean;
      Reserved_5_7   : A0B.Types.Reserved_3;
      BFHFNMIGN      : Boolean;
      STKALIGN       : Boolean;
      Reserved_10_15 : A0B.Types.Reserved_6;
      DC             : Boolean;
      IC             : Boolean;
      BP             : Boolean;
      Reserved_19_31 : A0B.Types.Reserved_13;
   end record with Object_Size => 32;

   for CCR_Register use record
      NONBASETHRDENA at 0 range 0 .. 0;
      USERSETMPEND   at 0 range 1 .. 1;
      Reserved_2_2   at 0 range 2 .. 2;
      UNALIGN_TRP    at 0 range 3 .. 3;
      DIV_0_TRP      at 0 range 4 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      BFHFNMIGN      at 0 range 8 .. 8;
      STKALIGN       at 0 range 9 .. 9;
      Reserved_10_15 at 0 range 10 .. 15;
      DC             at 0 range 16 .. 16;
      IC             at 0 range 17 .. 17;
      BP             at 0 range 18 .. 18;
      Reserved_19_31 at 0 range 19 .. 31;
   end record;

   type CCSIDR_Register is record
      LineSize      : A0B.Types.Unsigned_3;
      Associativity : A0B.Types.Unsigned_10;
      NumSets       : A0B.Types.Unsigned_15;
      WA            : Boolean;
      RA            : Boolean;
      WB            : Boolean;
      WT            : Boolean;
   end record with Object_Size => 32;

   for CCSIDR_Register use record
      LineSize      at 0 range 0 .. 2;
      Associativity at 0 range 3 .. 12;
      NumSets       at 0 range 13 .. 27;
      WA            at 0 range 28 .. 28;
      RA            at 0 range 29 .. 29;
      WB            at 0 range 30 .. 30;
      WT            at 0 range 31 .. 31;
   end record;

   type CPACR_Register is record
      CP0            : A0B.Types.Unsigned_2 := 0;
      CP1            : A0B.Types.Unsigned_2 := 0;
      CP2            : A0B.Types.Unsigned_2 := 0;
      CP3            : A0B.Types.Unsigned_2 := 0;
      CP4            : A0B.Types.Unsigned_2 := 0;
      CP5            : A0B.Types.Unsigned_2 := 0;
      CP6            : A0B.Types.Unsigned_2 := 0;
      CP7            : A0B.Types.Unsigned_2 := 0;
      Reserved_16_19 : A0B.Types.Reserved_4;
      CP10           : A0B.Types.Unsigned_2 := 0;
      CP11           : A0B.Types.Unsigned_2 := 0;
      Reserved_24_31 : A0B.Types.Reserved_8;
   end record with Object_Size => 32;

   for CPACR_Register use record
      CP0            at 0 range 0 .. 1;
      CP1            at 0 range 2 .. 3;
      CP2            at 0 range 4 .. 5;
      CP3            at 0 range 6 .. 7;
      CP4            at 0 range 8 .. 9;
      CP5            at 0 range 10 .. 11;
      CP6            at 0 range 12 .. 13;
      CP7            at 0 range 14 .. 15;
      Reserved_16_19 at 0 range 16 .. 19;
      CP10           at 0 range 20 .. 21;
      CP11           at 0 range 22 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   type CSSELR_Register is record
      InD           : Boolean;
      Level         : A0B.Types.Unsigned_3;
      Reserved_4_31 : A0B.Types.Reserved_28;
   end record with Object_Size => 32;

   for CSSELR_Register use record
      InD           at 0 range 0 .. 0;
      Level         at 0 range 1 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   type HFSR_Register is record
      Reserved_0_0  : Boolean;
      VECTTBL       : Boolean;
      Reserved_2_29 : A0B.Types.Reserved_28;
      FORCED        : Boolean;
      DEBUGEVT      : Boolean;
   end record with Object_Size => 32;

   for HFSR_Register use record
      Reserved_0_0  at 0 range 0 .. 0;
      VECTTBL       at 0 range 1 .. 1;
      Reserved_2_29 at 0 range 2 .. 29;
      FORCED        at 0 range 30 .. 30;
      DEBUGEVT      at 0 range 31 .. 31;
   end record;

   type ICSR_Register is record
      VECTACTIVE     : A0B.ARMv7M.Exception_Number_Field := 0;
      Reserved_9_10  : A0B.Types.Reserved_2;
      RETTOBASE      : Boolean := False;
      VECTPENDING    : A0B.ARMv7M.Exception_Number_Field := 0;
      Reserved_21    : A0B.Types.Reserved_1;
      ISRPENDING     : Boolean := False;
      ISRPREEMPT     : Boolean := False;
      Reserved_24    : A0B.Types.Reserved_1;
      PENDSTCLR      : Boolean := False;
      PENDSTSET      : Boolean := False;
      PENDSVCLR      : Boolean := False;
      PENDSVSET      : Boolean := False;
      Reserved_29_30 : A0B.Types.Reserved_2;
      NMIPENDSET     : Boolean := False;
   end record with Object_Size => 32;

   for ICSR_Register use record
      VECTACTIVE     at 0 range 0 .. 8;
      Reserved_9_10  at 0 range 9 .. 10;
      RETTOBASE      at 0 range 11 .. 11;
      VECTPENDING    at 0 range 12 .. 20;
      Reserved_21    at 0 range 21 .. 21;
      ISRPENDING     at 0 range 22 .. 22;
      ISRPREEMPT     at 0 range 23 .. 23;
      Reserved_24    at 0 range 24 .. 24;
      PENDSTCLR      at 0 range 25 .. 25;
      PENDSTSET      at 0 range 26 .. 26;
      PENDSVCLR      at 0 range 27 .. 27;
      PENDSVSET      at 0 range 28 .. 28;
      Reserved_29_30 at 0 range 29 .. 30;
      NMIPENDSET     at 0 range 31 .. 31;
   end record;

   type MMFSR_Register is record
      IACCVIOL     : Boolean;
      DACCVIOL     : Boolean;
      Reserved_2_2 : A0B.Types.Reserved_1;
      MUNSTKERR    : Boolean;
      MSTKERR      : Boolean;
      MLSPERR      : Boolean;
      Reserved_6_6 : A0B.Types.Reserved_1;
      MMARVALID    : Boolean;
   end record with Object_Size => 8;

   for MMFSR_Register use record
      IACCVIOL     at 0 range 0 .. 0;
      DACCVIOL     at 0 range 1 .. 1;
      Reserved_2_2 at 0 range 2 .. 2;
      MUNSTKERR    at 0 range 3 .. 3;
      MSTKERR      at 0 range 4 .. 4;
      MLSPERR      at 0 range 5 .. 5;
      Reserved_6_6 at 0 range 6 .. 6;
      MMARVALID    at 0 range 7 .. 7;
   end record;

   type SHCSR_Register is record
      MEMFAULTACT    : Boolean;
      BUSFAULTACT    : Boolean;
      Reserved_2     : A0B.Types.Reserved_1;
      USGFAULTACT    : Boolean;
      Reserved_4_6   : A0B.Types.Reserved_3;
      SVCALLACT      : Boolean;
      MONITORACT     : Boolean;
      Reserved_9     : A0B.Types.Reserved_1;
      PENDSVACT      : Boolean;
      SYSTICKACT     : Boolean;
      USGFAULTPENDED : Boolean;
      MEMFAULTPENDED : Boolean;
      BUSFAULTPENDED : Boolean;
      SVCALLPENDED   : Boolean;
      MEMFAULTENA    : Boolean;
      BUSFAULTENA    : Boolean;
      USGFAULTENA    : Boolean;
      Reserved_19_31 : A0B.Types.Reserved_13;
   end record with Object_Size => 32;

   for SHCSR_Register use record
      MEMFAULTACT    at 0 range 0 .. 0;
      BUSFAULTACT    at 0 range 1 .. 1;
      Reserved_2     at 0 range 2 .. 2;
      USGFAULTACT    at 0 range 3 .. 3;
      Reserved_4_6   at 0 range 4 .. 6;
      SVCALLACT      at 0 range 7 .. 7;
      MONITORACT     at 0 range 8 .. 8;
      Reserved_9     at 0 range 9 .. 9;
      PENDSVACT      at 0 range 10 .. 10;
      SYSTICKACT     at 0 range 11 .. 11;
      USGFAULTPENDED at 0 range 12 .. 12;
      MEMFAULTPENDED at 0 range 13 .. 13;
      BUSFAULTPENDED at 0 range 14 .. 14;
      SVCALLPENDED   at 0 range 15 .. 15;
      MEMFAULTENA    at 0 range 16 .. 16;
      BUSFAULTENA    at 0 range 17 .. 17;
      USGFAULTENA    at 0 range 18 .. 18;
      Reserved_19_31 at 0 range 19 .. 31;
   end record;

   type UFSR_Register is record
      UNDEFINSTR     : Boolean;
      INVSTATE       : Boolean;
      INVPC          : Boolean;
      NOCP           : Boolean;
      Reserved_4_7   : A0B.Types.Reserved_4;
      UNALIGNED      : Boolean;
      DIVBYZERO      : Boolean;
      Reserved_10_15 : A0B.Types.Reserved_6;
   end record with Object_Size => 16;

   for UFSR_Register use record
      UNDEFINSTR     at 0 range 0 .. 0;
      INVSTATE       at 0 range 1 .. 1;
      INVPC          at 0 range 2 .. 2;
      NOCP           at 0 range 3 .. 3;
      Reserved_4_7   at 0 range 4 .. 7;
      UNALIGNED      at 0 range 8 .. 8;
      DIVBYZERO      at 0 range 9 .. 9;
      Reserved_10_15 at 0 range 10 .. 15;
   end record;

   type CFSR_Register is record
      MemManage  : MMFSR_Register;
      BusFault   : BFSR_Register;
      UsageFault : UFSR_Register;
   end record with Object_Size => 32;

   for CFSR_Register use record
      MemManage  at 0 range 0 .. 7;
      BusFault   at 0 range 8 .. 15;
      UsageFault at 0 range 16 .. 31;
   end record;

   type SHPR_Register is
     array (A0B.ARMv7M.Exception_Number range 4 .. 15)
       of A0B.ARMv7M.Priority_Value;

   --  CPUID    : A0B.Types.Reserved_32;
   --    with Import,
   --         Volatile,
   --         Full_Access_Only,
   --         Address => System.Storage_Elements.To_Address (16#E000_ED00#);
   --  CPUID Base Register

   ICSR     : ICSR_Register
     with Import,
          Volatile,
          Full_Access_Only,
          Address => System.Storage_Elements.To_Address (16#E000_ED04#);
   --  Interrupt Control and State Register

   --  VTOR     : A0B.Types.Reserved_32;
   --    with Import,
   --         Volatile,
   --         Full_Access_Only,
   --         Address => System.Storage_Elements.To_Address (16#E000_ED08#);
   --  Vector Table Offset Register

   --  AIRCR    : A0B.Types.Reserved_32;
   --    with Import,
   --         Volatile,
   --         Full_Access_Only,
   --         Address => System.Storage_Elements.To_Address (16#E000_ED0C#);
   --  Application Interrupt and Reset Control Register

   --  SCR      : A0B.Types.Reserved_32;
   --    with Import,
   --         Volatile,
   --         Full_Access_Only,
   --         Address => System.Storage_Elements.To_Address (16#E000_ED10#);
   --  System Control Register

   CCR      : CCR_Register
     with Import,
          Volatile,
          Full_Access_Only,
          Address => System.Storage_Elements.To_Address (16#E000_ED14#);
   --  Configuration and Control Register

   SHPR     : SHPR_Register
     with Import,
          Volatile,
          Address => System.Storage_Elements.To_Address (16#E000_ED18#);
   --  System Handler Priority Register 1/2/3
   --
   --  SHPR is a set of SHPR1/SHPR2/SHPR3 registers.
   --
   --  It is byte, aligned halfword, and word accessible, see
   --  [ARM B3.2.10..B3.2.12].

   SHCSR    : SHCSR_Register
     with Import,
          Volatile,
          Full_Access_Only,
          Address => System.Storage_Elements.To_Address (16#E000_ED24#);
   --  System Handler Control and State Register

   CFSR     : CFSR_Register
     with Import,
          Volatile,
          Full_Access_Only,
          Address => System.Storage_Elements.To_Address (16#E000_ED28#);
   --  Configurable Fault Status Register

   HFSR     : HFSR_Register
     with Import,
          Volatile,
          Full_Access_Only,
          Address => System.Storage_Elements.To_Address (16#E000_ED2C#);
   --  HardFault Status Register

   --  DFSR     : A0B.Types.Reserved_32;
   --    with Import,
   --         Volatile,
   --         Full_Access_Only,
   --         Address => System.Storage_Elements.To_Address (16#E000_ED30#);
   --  Debug Fault Status Register

   MMFAR    : System.Storage_Elements.Integer_Address
     with Import,
          Volatile,
          Full_Access_Only,
          Address => System.Storage_Elements.To_Address (16#E000_ED34#);
   --  MemManage Fault Address Register

   BFAR     : System.Storage_Elements.Integer_Address
     with Import,
          Volatile,
          Full_Access_Only,
          Address => System.Storage_Elements.To_Address (16#E000_ED38#);
   --  BusFault Address Register

   --  AFSR     : A0B.Types.Reserved_32;
   --    with Import,
   --         Volatile,
   --         Full_Access_Only,
   --         Address => System.Storage_Elements.To_Address (16#E000_ED3C#);
   --  Auxiliary Fault Status Register

   --  ID_PFR0  : A0B.Types.Reserved_32;
   --    with Import,
   --         Volatile,
   --         Full_Access_Only,
   --         Address => System.Storage_Elements.To_Address (16#E000_ED40#);
   --  Processor Feature Register 0

   --  ID_PFR1  : A0B.Types.Reserved_32;
   --    with Import,
   --         Volatile,
   --         Full_Access_Only,
   --         Address => System.Storage_Elements.To_Address (16#E000_ED44#);
   --  Processor Feature Register 1

   --  ID_DFR0  : A0B.Types.Reserved_32;
   --    with Import,
   --         Volatile,
   --         Full_Access_Only,
   --         Address => System.Storage_Elements.To_Address (16#E000_ED48#);
   --  Debug Feature Register 0

   --  ID_AFR0  : A0B.Types.Reserved_32;
   --    with Import,
   --         Volatile,
   --         Full_Access_Only,
   --         Address => System.Storage_Elements.To_Address (16#E000_ED4C#);
   --  Auxiliary Feature Register 0

   --  ID_MMFR0 : A0B.Types.Reserved_32;
   --    with Import,
   --         Volatile,
   --         Full_Access_Only,
   --         Address => System.Storage_Elements.To_Address (16#E000_ED50#);
   --  Memory Model Feature Register 0

   --  ID_MMFR1 : A0B.Types.Reserved_32;
   --    with Import,
   --         Volatile,
   --         Full_Access_Only,
   --         Address => System.Storage_Elements.To_Address (16#E000_ED54#);
   --  Memory Model Feature Register 1

   --  ID_MMFR2 : A0B.Types.Reserved_32;
   --    with Import,
   --         Volatile,
   --         Full_Access_Only,
   --         Address => System.Storage_Elements.To_Address (16#E000_ED58#);
   --  Memory Model Feature Register 2

   --  ID_MMFR3 : A0B.Types.Reserved_32;
   --    with Import,
   --         Volatile,
   --         Full_Access_Only,
   --         Address => System.Storage_Elements.To_Address (16#E000_ED5C#);
   --  Memory Model Feature Register 3

   --  ID_ISAR0 : A0B.Types.Reserved_32;
   --    with Import,
   --         Volatile,
   --         Full_Access_Only,
   --         Address => System.Storage_Elements.To_Address (16#E000_ED60#);
   --  Instruction Set Attribute Register 0

   --  ID_ISAR1 : A0B.Types.Reserved_32;
   --    with Import,
   --         Volatile,
   --         Full_Access_Only,
   --         Address => System.Storage_Elements.To_Address (16#E000_ED64#);
   --  Instruction Set Attribute Register 1

   --  ID_ISAR2 : A0B.Types.Reserved_32;
   --    with Import,
   --         Volatile,
   --         Full_Access_Only,
   --         Address => System.Storage_Elements.To_Address (16#E000_ED68#);
   --  Instruction Set Attribute Register 2

   --  ID_ISAR3 : A0B.Types.Reserved_32;
   --    with Import,
   --         Volatile,
   --         Full_Access_Only,
   --         Address => System.Storage_Elements.To_Address (16#E000_ED6C#);
   --  Instruction Set Attribute Register 3

   --  ID_ISAR4 : A0B.Types.Reserved_32;
   --    with Import,
   --         Volatile,
   --         Full_Access_Only,
   --         Address => System.Storage_Elements.To_Address (16#E000_ED70#);
   --  Instruction Set Attribute Register 4

   --  ID_ISAR5 : A0B.Types.Reserved_32;
   --    with Import,
   --         Volatile,
   --         Full_Access_Only,
   --         Address => System.Storage_Elements.To_Address (16#E000_ED74#);
   --  ID_ISAR5: Reserved, RAZ

   --  CLIDR    : A0B.Types.Reserved_32;
   --    with Import,
   --         Volatile,
   --         Full_Access_Only,
   --         Address => System.Storage_Elements.To_Address (16#E000_ED78#);
   --  Cache Level ID Register

   --  CTR      : A0B.Types.Reserved_32;
   --    with Import,
   --         Volatile,
   --         Full_Access_Only,
   --         Address => System.Storage_Elements.To_Address (16#E000_ED7C#);
   --  Cache Type Register

   CCSIDR   : CCSIDR_Register
     with Import,
          Volatile,
          Full_Access_Only,
          Address => System.Storage_Elements.To_Address (16#E000_ED80#);
   --  Cache Size ID Registers

   CSSELR   : CSSELR_Register
     with Import,
          Volatile,
          Full_Access_Only,
          Address => System.Storage_Elements.To_Address (16#E000_ED84#);
   --  Cache Size Selection Register

   CPACR    : CPACR_Register
     with Import,
          Volatile,
          Full_Access_Only,
          Address => System.Storage_Elements.To_Address (16#E000_ED88#);
   --  Coprocessor Access Control Register

end A0B.ARMv7M.System_Control_Block;
