--
--  Copyright (C) 2024-2025, Vadim Godunko <vgodunko@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
--

with System.Storage_Elements;

with A0B.ARMv7M.Startup_Utilities.Memory_Initialization;

procedure A0B.ARMv7M.Startup_Utilities.Copy_Data_Section is
   sidata : constant System.Storage_Elements.Integer_Address
     with Import, Convention => C, External_Name => "_sidata";
   sdata  : constant System.Storage_Elements.Integer_Address
     with Import, Convention => C, External_Name => "_sdata";
   edata  : constant System.Storage_Elements.Integer_Address
     with Import, Convention => C, External_Name => "_edata";

begin
   A0B.ARMv7M.Startup_Utilities.Memory_Initialization.Copy
     (sdata'Address, edata'Address, sidata'Address);
end A0B.ARMv7M.Startup_Utilities.Copy_Data_Section;
