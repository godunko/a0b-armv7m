--
--  Copyright (C) 2024, Vadim Godunko <vgodunko@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
--

with A0B.Types;

package A0B.ARMv7M.Parameters
  with Preelaborate, No_Elaboration_Code_All
is

   CPU_Frequency     : A0B.Types.Unsigned_32 := 0;
   --  Frequency of the CPU core. Must be set by startup code.

   SysTick_Frequency : A0B.Types.Unsigned_32 := 0;
   --  Frequency of the extenral SysTick signal. Must be set by startup if
   --  external clock for SysTick timer is available.

end A0B.ARMv7M.Parameters;
