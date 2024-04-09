--
--  Copyright (C) 2024, Vadim Godunko <vgodunko@gmail.com>
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

   MemManage_Exception    : constant Exception_Number := 4;
   BusFault_Exception     : constant Exception_Number := 5;
   UsageFault_Exception   : constant Exception_Number := 6;
   SVCall_Exception       : constant Exception_Number := 11;
   DebugMonitor_Exception : constant Exception_Number := 12;
   PendSV_Exception       : constant Exception_Number := 14;
   SysTick_Exception      : constant Exception_Number := 15;

   type External_Interrupt_Number is range 0 .. 495;
   --  External interrupt number (IRQ).

   type Priority_Value is mod 2 ** 8;
   --  Value of the priority. It follow ARM convention, when lower number
   --  means higher priority.

end A0B.ARMv7M;