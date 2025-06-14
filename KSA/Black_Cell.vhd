library ieee;
use ieee.std_logic_1164.all;

entity Black_Cell is
  
	port(Gik, Pik, Gk1j, Pk1j: in std_logic;
       	     Gij, Pij: out std_logic);

end Black_Cell;


architecture Behavioral of Black_Cell is
  
begin
  
  	Gij<= Gik or ( Pik and Gk1j ); 
	Pij<= Pik and Pk1j;
  
end Behavioral;
