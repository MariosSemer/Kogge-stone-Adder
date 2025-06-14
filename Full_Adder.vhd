library ieee;
use ieee.std_logic_1164.all;

entity Full_Adder is 

	port(A,B,Cin:in std_logic;
	     Sum,P,G:out std_logic);

end Full_Adder;

architecture Behavioral of Full_Adder is 

signal temp1,temp2,temp3:std_logic;

begin 

	temp1<=A xor B;
	temp2<=A and B;
	temp3<=temp1 and Cin;
	Sum <= temp1 xor Cin;
	P <= temp1;
	G <= temp2;

end Behavioral;
