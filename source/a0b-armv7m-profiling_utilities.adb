--
--  Copyright (C) 2024, Vadim Godunko <vgodunko@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
--

with A0B.ARMv7M.SCS.DWT;

package body A0B.ARMv7M.Profiling_Utilities is

   ------------
   -- Cycles --
   ------------

   function Cycles (From : Stamp; To : Stamp) return A0B.Types.Unsigned_32 is
      use type A0B.Types.Unsigned_32;

   begin
      return A0B.Types.Unsigned_32 (To) - A0B.Types.Unsigned_32 (From);
   end Cycles;

   ---------
   -- Get --
   ---------

   function Get return Stamp is
   begin
      return Stamp (A0B.ARMv7M.SCS.DWT.DWT_CYCCNT.CYCCNT);
   end Get;

   ----------------
   -- Initialize --
   ----------------

   procedure Initialize is
   begin
      declare
         Aux : A0B.ARMv7M.SCS.DWT.DWT_CTRL_Register :=
           A0B.ARMv7M.SCS.DWT.DWT_CTRL;

      begin
         Aux.CYCCNTENA := True;

         A0B.ARMv7M.SCS.DWT.DWT_CTRL := Aux;
      end;
   end Initialize;

end A0B.ARMv7M.Profiling_Utilities;
