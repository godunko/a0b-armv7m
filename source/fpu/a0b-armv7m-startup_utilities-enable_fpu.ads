--
--  Copyright (C) 2024, Vadim Godunko <vgodunko@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
--

--  Enables floating point coprocessor.

procedure A0B.ARMv7M.Startup_Utilities.Enable_FPU
  with Preelaborate, No_Elaboration_Code_All, Inline_Always;
