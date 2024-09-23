--
--  Copyright (C) 2024, Vadim Godunko <vgodunko@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
--

pragma Restrictions (No_Elaboration_Code);

package A0B.ARMv7M.Startup_Utilities
  with Preelaborate
is

   procedure Enable_FPU with Inline_Always;
   --  Enables floating point coprocessor.

end A0B.ARMv7M.Startup_Utilities;
