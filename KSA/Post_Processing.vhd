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
