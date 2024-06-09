--
--  Copyright (C) 2024, Vadim Godunko <vgodunko@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
--

pragma Restrictions (No_Elaboration_Code);

pragma Ada_2022;

with A0B.ARMv7M.CMSIS;       use A0B.ARMv7M.CMSIS;
with A0B.ARMv7M.System_Control_Block.Cache;
with A0B.Types;
with A0B.Types.GCC_Builtins; use A0B.Types.GCC_Builtins;

package body A0B.ARMv7M.Cache_Utilities is

   use type A0B.Types.Unsigned_32;
   use type System.Storage_Elements.Integer_Address;
   use type System.Storage_Elements.Storage_Count;

   package SCB renames A0B.ARMv7M.System_Control_Block;

   DCache_Line_Size : constant := 32;

   ------------------
   -- Clean_DCache --
   ------------------

   procedure Clean_DCache
     (Address : System.Address;
      Size    : System.Storage_Elements.Storage_Count)
   is
      Current   : System.Storage_Elements.Integer_Address :=
        System.Storage_Elements.To_Integer (Address) and 16#FFFF_FFE0#;
      Remaining : System.Storage_Elements.Storage_Count :=
        Size
          + System.Storage_Elements.Storage_Count
             (System.Storage_Elements.To_Integer (Address)
                and 16#0000_001F#);

   begin
      if Size = 0 then
         return;
      end if;

      Data_Synchronization_Barrier;

      loop
         SCB.Cache.DCCMVAC := Current;
         Current           := @ + DCache_Line_Size;
         Remaining         := @ - DCache_Line_Size;

         exit when Remaining = 0;
      end loop;

      Data_Synchronization_Barrier;
      Instruction_Synchronization_Barrier;
   end Clean_DCache;

   -----------------------------
   -- Clean_Invalidate_DCache --
   -----------------------------

   procedure Clean_Invalidate_DCache
     (Address : System.Address;
      Size    : System.Storage_Elements.Storage_Count)
   is
      Current   : System.Storage_Elements.Integer_Address :=
        System.Storage_Elements.To_Integer (Address) and 16#FFFF_FFE0#;
      Remaining : System.Storage_Elements.Storage_Count :=
        Size
          + System.Storage_Elements.Storage_Count
             (System.Storage_Elements.To_Integer (Address)
                and 16#0000_001F#);

   begin
      if Size = 0 then
         return;
      end if;

      Data_Synchronization_Barrier;

      loop
         SCB.Cache.DCCIMVAC := Current;
         Current           := @ + DCache_Line_Size;
         Remaining         := @ - DCache_Line_Size;

         exit when Remaining = 0;
      end loop;

      Data_Synchronization_Barrier;
      Instruction_Synchronization_Barrier;
   end Clean_Invalidate_DCache;

   -------------------
   -- Enable_DCache --
   -------------------

   procedure Enable_DCache is
      --  Ways      : A0B.Types.Unsigned_10;
      --  Sets      : A0B.Types.Unsigned_15;
      Ways      : A0B.Types.Unsigned_32;
      Sets      : A0B.Types.Unsigned_32;
      Way       : A0B.Types.Unsigned_32;
      Set       : A0B.Types.Unsigned_32;
      Way_Shift : Natural;
      Set_Shift : Natural;
      CCSIDR    : A0B.ARMv7M.System_Control_Block.SCB_CCSIDR_Register;

   begin
      --  Select Level 1 Data cache.

      declare
         Aux : A0B.ARMv7M.System_Control_Block.SCB_CSSELR_Register :=
           A0B.ARMv7M.System_Control_Block.SCB.CSSELR;

      begin
         Aux.InD   := False;
         Aux.Level := 0;

         A0B.ARMv7M.System_Control_Block.SCB.CSSELR := Aux;
      end;

      Data_Synchronization_Barrier;

      --  Compute data cache parameters and shifts of fields in DCISW
      --  regisger.

      CCSIDR := A0B.ARMv7M.System_Control_Block.SCB.CCSIDR;

      Ways := A0B.Types.Unsigned_32 (CCSIDR.Associativity);
      Sets := A0B.Types.Unsigned_32 (CCSIDR.NumSets);

      Set_Shift := Natural (CCSIDR.LineSize) + 4;
      --    LineSize  = Log2 (LineLen / 4) - 2
      --  and
      --    Set_Shift = Log2 (LineLen)
      --  thus
      --    Set_Shift = LineSize + Log2 (4) + 2

      Way_Shift := Natural (clz (A0B.Types.Unsigned_32 (Ways)));

      --  Invalidate data cache line by line.

      Way := A0B.Types.Unsigned_32 (Ways);

      loop
         Set := A0B.Types.Unsigned_32 (Sets);

         loop
            declare
               Aux : constant A0B.Types.Unsigned_32 :=
                 A0B.Types.Shift_Left (Way, Way_Shift)
                   or A0B.Types.Shift_Left (Set, Set_Shift);

            begin
               SCB.Cache.DCISW := Aux;
            end;

            exit when Set = 0;

            Set := @ - 1;
         end loop;

         exit when Way = 0;

         Way := @ - 1;
      end loop;

      Data_Synchronization_Barrier;

      SCB.SCB.CCR.DC := True;
      --  Enable instruction cache

      Data_Synchronization_Barrier;
      Instruction_Synchronization_Barrier;
   end Enable_DCache;

   -------------------
   -- Enable_ICache --
   -------------------

   procedure Enable_ICache is
   begin
      Data_Synchronization_Barrier;
      Instruction_Synchronization_Barrier;

      SCB.Cache.ICIALLU := 0;
      --  Invalidate instructions cache

      Data_Synchronization_Barrier;
      Instruction_Synchronization_Barrier;

      SCB.SCB.CCR.IC := True;
      --  Enable instruction cache

      Data_Synchronization_Barrier;
      Instruction_Synchronization_Barrier;
   end Enable_ICache;

   -----------------------
   -- Invalidate_DCache --
   -----------------------

   procedure Invalidate_DCache
     (Address : System.Address;
      Size    : System.Storage_Elements.Storage_Count)
   is
      Current   : System.Storage_Elements.Integer_Address :=
        System.Storage_Elements.To_Integer (Address) and 16#FFFF_FFE0#;
      Remaining : System.Storage_Elements.Storage_Count :=
        Size
          + System.Storage_Elements.Storage_Count
             (System.Storage_Elements.To_Integer (Address)
                and 16#0000_001F#);

   begin
      if Size = 0 then
         return;
      end if;

      Data_Synchronization_Barrier;

      loop
         SCB.Cache.DCIMVAC := Current;
         Current           := @ + DCache_Line_Size;
         Remaining         := @ - DCache_Line_Size;

         exit when Remaining = 0;
      end loop;

      Data_Synchronization_Barrier;
      Instruction_Synchronization_Barrier;
   end Invalidate_DCache;

end A0B.ARMv7M.Cache_Utilities;
