--
--  Copyright (C) 2024, Vadim Godunko <vgodunko@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
--

with System.Storage_Elements;

package A0B.ARMv7M.Cache_Utilities
  with Preelaborate, No_Elaboration_Code_All
is

   procedure Enable_ICache with Inline_Always;
   --  Turns on I-Cache

   procedure Enable_DCache with Inline_Always;
   --  Turns on D-Cache

   procedure Invalidate_DCache
     (Address : System.Address;
      Size    : System.Storage_Elements.Storage_Count);
   --  Invalidates D-Cache for the given address.
   --
   --  D-Cache is invalidated starting from a 32 byte aligned address in 32
   --  byte granularity.
   --
   --  D-Cache memory blocks which are part of given address + given size are
   --  invalidated.

   procedure Clean_DCache
     (Address : System.Address;
      Size    : System.Storage_Elements.Storage_Count);
   --  Cleans D-Cache for the given address
   --
   --  D-Cache is cleaned starting from a 32 byte aligned address in 32 byte
   --  granularity.
   --
   --  D-Cache memory blocks which are part of given address + given size are
   --  cleaned.

   procedure Clean_Invalidate_DCache
     (Address : System.Address;
      Size    : System.Storage_Elements.Storage_Count);
   --  Cleans and invalidates D_Cache for the given address
   --
   --  D-Cache is cleaned and invalidated starting from a 32 byte aligned
   --  address in 32 byte granularity.
   --
   --  D-Cache memory blocks which are part of given address + given size are
   --  cleaned and invalidated.

end A0B.ARMv7M.Cache_Utilities;
