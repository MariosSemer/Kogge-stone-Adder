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