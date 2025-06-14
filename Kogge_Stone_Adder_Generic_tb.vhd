library ieee;
use ieee.std_logic_1164.all;

entity tb_Kogge_Stone_Adder is
	generic (
		N : positive := 32  -- Width must be power of 2
	);
end entity;

architecture Behavioral of tb_Kogge_Stone_Adder is

component Kogge_Stone_Adder is
 	port (A, B   : in  std_logic_vector(N-1 downto 0);
   	      C0     : in  std_logic;
  	      S      : out std_logic_vector(N-1 downto 0);
  	      Cout   : out std_logic
    	);
end component;

signal A, B, S : std_logic_vector(N-1 downto 0) := (others => '0');
signal C0, Cout : std_logic := '0';

begin

KOGGE_STONE_ADDER_N_BIT: Kogge_Stone_Adder port map( A => A,
					       B => B,
					       C0 => C0,
					       S => S,
					       Cout => Cout);

stimulus_process: process
begin
	A <= x"FFFFFFFF"; B <= x"00000000"; C0 <= '1'; wait for 100 ns;
	A <= x"12345678"; B <= x"00827631"; C0 <= '1'; wait for 100 ns;
	A <= x"FFFFFFFF"; B <= x"00000000"; C0 <= '1'; wait for 100 ns;
	A <= x"0000FFFF"; B <= x"FFFF0000"; C0 <= '0'; wait for 100 ns;	
	
				
end process;
end Behavioral;