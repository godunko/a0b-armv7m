--
--  Copyright (C) 2024-2025, Vadim Godunko <vgodunko@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
--

with A0B.ARMv7M.Startup_Utilities.Memory_Initialization;
with A0B.Types;

procedure A0B.ARMv7M.Startup_Utilities.Fill_DTCM_BSS_Section is
   sdtcmbss : constant A0B.Types.Unsigned_32
     with Import, Convention => C, External_Name => "_sdtcmbss";
   edtcmbss : constant A0B.Types.Unsigned_32
     with Import, Convention => C, External_Name => "_edtcmbss";

begin
   A0B.ARMv7M.Startup_Utilities.Memory_Initialization.Fill
     (sdtcmbss'Address, edtcmbss'Address);
end A0B.ARMv7M.Startup_Utilities.Fill_DTCM_BSS_Section;
