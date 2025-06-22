--
--  Copyright (C) 2024-2025, Vadim Godunko <vgodunko@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
--

with A0B.ARMv7M.Startup_Utilities.Memory_Initialization;
with A0B.Types;

procedure A0B.ARMv7M.Startup_Utilities.Copy_ITCM_Text_Section is
   siitcmtext : constant A0B.Types.Unsigned_32
     with Import, Convention => C, External_Name => "_siitcmtext";
   sitcmtext  : constant A0B.Types.Unsigned_32
     with Import, Convention => C, External_Name => "_sitcmtext";
   eitcmtext  : constant A0B.Types.Unsigned_32
     with Import, Convention => C, External_Name => "_eitcmtext";

begin
   A0B.ARMv7M.Startup_Utilities.Memory_Initialization.Copy
     (sitcmtext'Address, eitcmtext'Address, siitcmtext'Address);
end A0B.ARMv7M.Startup_Utilities.Copy_ITCM_Text_Section;
