--
--  Copyright (C) 2024, Vadim Godunko <vgodunko@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
--

package A0B.ARMv7M.NVIC_Utilities
  with Preelaborate, No_Elaboration_Code_All
is

   procedure Disable_Interrupt (Interrupt : External_Interrupt_Number);

   procedure Enable_Interrupt (Interrupt : External_Interrupt_Number);

   procedure Set_Pending (Interrupt : External_Interrupt_Number);

   procedure Clear_Pending (Interrupt : External_Interrupt_Number);

   function Get_Priority
     (Interrupt : External_Interrupt_Number) return Priority_Value;

   procedure Set_Priority
     (Interrupt : External_Interrupt_Number;
      Priority  : Priority_Value);

end A0B.ARMv7M.NVIC_Utilities;
