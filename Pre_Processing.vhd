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