--
--  Copyright (C) 2024, Vadim Godunko <vgodunko@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
--

pragma Restrictions (No_Elaboration_Code);

with A0B.Types;

package A0B.ARMv7M.Profiling_Utilities
  with Preelaborate
is

   type Stamp is private;

   procedure Initialize;

   function Get return Stamp;

   function Cycles (From : Stamp; To : Stamp) return A0B.Types.Unsigned_32;

private

   type Stamp is new A0B.Types.Unsigned_32;

end A0B.ARMv7M.Profiling_Utilities;
