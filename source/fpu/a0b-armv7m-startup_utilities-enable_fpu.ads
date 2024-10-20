--
--  Copyright (C) 2024, Vadim Godunko <vgodunko@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
--

--  Enables floating point coprocessor.

pragma Restrictions (No_Elaboration_Code);

procedure A0B.ARMv7M.Startup_Utilities.Enable_FPU
  with Preelaborate, Inline_Always;
