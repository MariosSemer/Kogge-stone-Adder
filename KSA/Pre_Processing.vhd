----------------------------------------------------------------------------------

-- Module Name: Pre Processing Unit
-- Project Name: N-bit Kogge-Stone Adder
-- Target Devices: Artix-7
-- Description:  This file implements the pre process, which generates the initial 
-- 		 propagate and generate signals from the input operands' bits using 
-- 		 basic logic operations.
-- Author : Semertzakis Marios

----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity Pre_Process is 

	port(A,B:in std_logic;
	     P,G:out std_logic);

end Pre_Process;


architecture Behavioral of Pre_Process is 

begin

	P <= A xor B;
	G <= A and B;

end Behavioral;
