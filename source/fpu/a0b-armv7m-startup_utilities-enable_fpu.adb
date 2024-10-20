--
--  Copyright (C) 2024, Vadim Godunko <vgodunko@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
--

pragma Restrictions (No_Elaboration_Code);

with A0B.ARMv7M.System_Control_Block; use A0B.ARMv7M.System_Control_Block;

procedure A0B.ARMv7M.Startup_Utilities.Enable_FPU is
   Aux : SCB_CPACR_Register := SCB.CPACR;

begin
   Aux.CP10 := 2#11#;
   Aux.CP11 := 2#11#;

   SCB.CPACR := Aux;
end A0B.ARMv7M.Startup_Utilities.Enable_FPU;
