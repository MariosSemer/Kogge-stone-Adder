----------------------------------------------------------------------------------

-- Module Name: Gray Cell
-- Project Name: N-bit Kogge-Stone Adder
-- Target Devices: Artix-7
-- Description:  This file implements the gray cell, which computes only the generate
--		 signal by combining the generate and propagate signals from two input pairs
-- Author : Semertzakis Marios

----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity Gray_Cell is 

	port(Gik,Pik,Gk1j:in std_logic;
	     Gij:out std_logic);

end Gray_Cell;

architecture Behavioral of Gray_Cell is 

begin

	Gij <= Gik or ( Pik and Gk1j );

end Behavioral;
