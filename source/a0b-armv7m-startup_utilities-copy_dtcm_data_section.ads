--
--  Copyright (C) 2024-2025, Vadim Godunko <vgodunko@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
--

--  Copy '.dtcm.data' from the flash to the DTCM RAM region.
--
--  It uses external symbols generated by the linker:
--   - _sidtcmdata
--   - _sdtcmdata
--   - _edtcmdata

procedure A0B.ARMv7M.Startup_Utilities.Copy_DTCM_Data_Section
  with Preelaborate, No_Elaboration_Code_All, Inline_Always;
