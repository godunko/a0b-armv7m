--
--  Copyright (C) 2024, Vadim Godunko <vgodunko@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
--

pragma Restrictions (No_Elaboration_Code);

package A0B.ARMv7M.NVIC_Utilities
  with Preelaborate
is

   procedure Disable_Interrupt (Interrupt : External_Interrupt_Number);

   procedure Enable_Interrupt (Interrupt : External_Interrupt_Number);

   procedure Set_Pending (Interrupt : External_Interrupt_Number);

   procedure Clear_Pending (Interrupt : External_Interrupt_Number);

end A0B.ARMv7M.NVIC_Utilities;