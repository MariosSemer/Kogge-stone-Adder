----------------------------------------------------------------------------------

-- Module Name: Post Processing Unit
-- Project Name: N-bit Kogge-Stone Adder
-- Target Devices: Artix-7
-- Description:  This file implements the post process, which computes the final sum 
-- 		 bits by XORing the propagate signal with the corresponding carry-in 
-- 		 for each bit.
-- Author : Semertzakis Marios

----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity Post_Process is
  
  	port(P, Ci: in std_logic;
             Sum: out std_logic);

end Post_Process;


architecture Behavioral of Post_Process is
 
begin
  
	Sum<= P xor Ci;
  
end Behavioral;
