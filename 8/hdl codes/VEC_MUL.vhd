

library IEEE;

--use IEEE.NUMERIC_STD_signed.ALL; 
use IEEE.STD_LOGIC_1164.all; 
use IEEE.STD_LOGIC_unsigned .all;	
use IEEE.STD_LOGIC_arith .all; 	   
--use type1.all;

entity VEC_MUL is
	 port(
		 CLK : in STD_LOGIC;
		 RST : in STD_LOGIC;  		 
		 m_d : in STD_LOGIC;
		 A,B : in STD_logic;	  
		 C : out std_logic
	     );
end VEC_MUL;

--}} End of automatically maintained section

architecture VEC_MUL of VEC_MUL is 
component mul_g8 is
	 port(
		 clk : in STD_LOGIC;
		 rst : in STD_LOGIC;		 
		 m_d : in STD_LOGIC;
		 a : in STD_LOGIC_VECTOR(7 downto 0);
		 b : in STD_LOGIC_VECTOR(7 downto 0);
		 res : out STD_LOGIC_VECTOR(7 downto 0)
	     );
end component;
begin  
	
 U_md: for i in 0 to 256 - 1 generate
		  
mul : mul_g8 
	 port map(
		 clk => clk, rst => rst,	 
		 m_d => m_d,
		 a => a(i),	 b => b(i),
		 res => c(i)
	     );	
	  end generate;	  
  
	 -- enter your statements here --

end VEC_MUL;  
