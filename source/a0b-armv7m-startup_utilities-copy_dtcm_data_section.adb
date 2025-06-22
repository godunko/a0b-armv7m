--
--  Copyright (C) 2024-2025, Vadim Godunko <vgodunko@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
--

with A0B.ARMv7M.Startup_Utilities.Memory_Initialization;
with A0B.Types;

procedure A0B.ARMv7M.Startup_Utilities.Copy_DTCM_Data_Section is
   sidtcmdata : constant A0B.Types.Unsigned_32
     with Import, Convention => C, External_Name => "_sidtcmdata";
   sdtcmdata  : constant A0B.Types.Unsigned_32
     with Import, Convention => C, External_Name => "_sdtcmdata";
   edtcmdata  : constant A0B.Types.Unsigned_32
     with Import, Convention => C, External_Name => "_edtcmdata";

begin
   A0B.ARMv7M.Startup_Utilities.Memory_Initialization.Copy
     (sdtcmdata'Address, edtcmdata'Address, sidtcmdata'Address);
end A0B.ARMv7M.Startup_Utilities.Copy_DTCM_Data_Section;
