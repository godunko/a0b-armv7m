--
--  Copyright (C) 2024, Vadim Godunko
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
--

pragma Restrictions (No_Elaboration_Code);

package A0B.ARMv7M is

   pragma Pure;

   type Exception_Number_Field is mod 2 ** 9;
   --  CPU exception number. Exception numbers starts from 1, and 0 value is
   --  used for special purpose (it is stack pointer in the exception vector
   --  table, thread mode indicator for currently handled exception, etc.)

   subtype Exception_Number is
     Exception_Number_Field range 1 .. Exception_Number_Field'Last;

end A0B.ARMv7M;