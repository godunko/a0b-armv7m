--
--  Copyright (C) 2024-2025, Vadim Godunko <vgodunko@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
--

pragma Ada_2022;

with System.Storage_Elements;

with A0B.Types;

package body A0B.ARMv7M.Startup_Utilities.Memory_Initialization is

   use type System.Address;
   use type System.Storage_Elements.Storage_Offset;

   ----------
   -- Copy --
   ----------

   procedure Copy
     (Start_Address : System.Address;
      End_Address   : System.Address;
      Load_Address  : System.Address)
   is
      Source_Address      : System.Address := Load_Address;
      Destination_Address : System.Address := Start_Address;

   begin
      if Source_Address /= Destination_Address then
         while Destination_Address /= End_Address loop
            declare
               Source      : constant A0B.Types.Unsigned_32
                 with Import, Address => Source_Address;
               Destination : A0B.Types.Unsigned_32
                 with Import, Address => Destination_Address;

            begin
               Destination         := Source;

               Source_Address      :=
                 @ + A0B.Types.Unsigned_32'Max_Size_In_Storage_Elements;
               Destination_Address :=
                 @ + A0B.Types.Unsigned_32'Max_Size_In_Storage_Elements;
            end;
         end loop;
      end if;
   end Copy;

   ----------
   -- Fill --
   ----------

   procedure Fill
     (Start_Address : System.Address;
      End_Address   : System.Address)
   is
      Destination_Address : System.Address := Start_Address;

   begin
      while Destination_Address /= End_Address loop
         declare
            Destination : A0B.Types.Unsigned_32
              with Import, Address => Destination_Address;

         begin
            Destination         := 0;

            Destination_Address :=
              @ + A0B.Types.Unsigned_32'Max_Size_In_Storage_Elements;
         end;
      end loop;
   end Fill;

end A0B.ARMv7M.Startup_Utilities.Memory_Initialization;
