--
--  Copyright (C) 2024-2025, Vadim Godunko <vgodunko@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
--

--  Various subprograms to be used by startup code to initialize text/data/bss
--  memory.

with System;

package A0B.ARMv7M.Startup_Utilities.Memory_Initialization
  with Preelaborate, No_Elaboration_Code_All
is

   procedure Copy
     (Start_Address : System.Address;
      End_Address   : System.Address;
      Load_Address  : System.Address);
   --  Copy data starting from Load_Address to the memory region at
   --  Start_Address .. End_Address-4.

   procedure Fill
     (Start_Address : System.Address;
      End_Address   : System.Address);
   --  Fill memory at Start_Address .. End_Address-4 by zero.

end A0B.ARMv7M.Startup_Utilities.Memory_Initialization;
