----------------------------------------------------------------------------------

-- Module Name: Kogge Stone Adder
-- Project Name: N-bit Kogge-Stone Adder
-- Target Devices: Artix-7
-- Description:  This file implements the Kogge Stone Adder, which combines all the
--		 files to implement the addition.
-- Author : Semertzakis Marios

----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.log2_pkg.all;

entity Kogge_Stone_Adder is
	generic (
		N : positive := 32  -- Width must be power of 2
	);
 	port (A, B   : in  std_logic_vector(N-1 downto 0);
   	      C0     : in  std_logic;
  	      S      : out std_logic_vector(N-1 downto 0);
  	      Cout   : out std_logic
    	);
end Kogge_Stone_Adder;

architecture Behavioral of Kogge_Stone_Adder is

   	 component Gray_Cell
         	port (
            		Gik, Pik, Gk1j : in  std_logic;
            		Gij            : out std_logic
        	);
    	end component;

    	component Pre_Process
        	port (
            		A, B : in  std_logic;
            		P, G : out std_logic
        	);
    	end component;

    	component Black_Cell
        	port (
            		Gik, Pik, Gk1j, Pk1j : in  std_logic;
            		Gij, Pij             : out std_logic
        	);
    	end component;

    	component Post_Process
        	port (
            		P, Ci  : in  std_logic;
            		Sum    : out std_logic
        	);
    	end component;

    	constant STAGES : natural := log2(N);
    	type stage_array is array(natural range <>) of std_logic_vector(N-1 downto 0);

    	signal G_stages : stage_array(0 to STAGES);
    	signal P_stages : stage_array(0 to STAGES);
    	signal Carries  : std_logic_vector(N-1 downto 0);

begin

    	-- Preprocessing

    	Pre_Process_Label:
    	for i in 0 to N-1 generate
        	Pre_Processing_Unit: Pre_Process
            	port map (A(i), B(i), P_stages(0)(i), G_stages(0)(i));
    	end generate;

    	-- Kogge-Stone Stages Computation

    	GENERATE_STAGES:
    	for i in 0 to STAGES-1 generate
        	constant STEP : integer := 2**i;
    	begin
        	GENERATE_STAGE_COLS:
        	for j in 0 to N-1 generate

            	-- Pass Values
            	one: if (j < STEP) generate
                	G_stages(i+1)(j) <= G_stages(i)(j);
                	P_stages(i+1)(j) <= P_stages(i)(j);
            	end generate;

            	-- Gray Cell
            	two: if (j >= STEP and j < 2*STEP) generate
                	Gray_Cell_Generation: Gray_Cell
                    	port map (
                        	Gik  => G_stages(i)(j),
                        	Pik  => P_stages(i)(j),
                        	Gk1j => G_stages(i)(j - STEP),
                        	Gij  => G_stages(i+1)(j)
                    	);
                	P_stages(i+1)(j) <= P_stages(i)(j);
            	end generate;

            	-- Black Cell
            	three: if (j >= 2*STEP) generate
                	Black_Cell_Generation: Black_Cell
                    	port map (
                        	Gik   => G_stages(i)(j),
                        	Pik   => P_stages(i)(j),
                        	Gk1j  => G_stages(i)(j - STEP),
                        	Pk1j  => P_stages(i)(j - STEP),
                        	Gij   => G_stages(i+1)(j),
                        	Pij   => P_stages(i+1)(j)
                    	);
            	end generate;

        	end generate;
    	end generate;
	
	-- Carries Generation

	Carries_Generation:
	for i in 0 to N-1 generate
		Carries(i) <= G_stages(STAGES)(i) OR (C0 AND P_stages(STAGES)(i));
	end generate;

	-- Carry Out

	Cout  <= Carries(N-1);
	
    	-- Post Processing 

	S(0) <= C0 xor P_stages(0)(0); 
    	Post_Processing_Label:
    	for i in 1 to N-1 generate
        	Post_Processing_Unit: Post_Process
            	port map (
                	P   => P_stages(0)(i),
                	Ci  => Carries(i-1),
                	Sum => S(i)
            	);
    	end generate;

end Behavioral;
