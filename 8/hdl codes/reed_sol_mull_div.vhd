
--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {reed_sol_mull_div} architecture {reed_sol_mull_div}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;  
use ieee.std_logic_arith.all;  
use ieee.std_logic_unsigned.all; 

entity reed_sol_mull_div is
	 port(
		 clk : in STD_LOGIC;
		 rst : in STD_LOGIC;
		 a : in STD_LOGIC_VECTOR(7 downto 0);
		 b : in STD_LOGIC_VECTOR(7 downto 0);	
		 m_d : in STD_LOGIC;	-- '0' - mull, '1' - div
		 tabla0 : in STD_LOGIC_VECTOR(7 downto 0);
		 tablb0 : in STD_LOGIC_VECTOR(7 downto 0);
		 tabl1 : in STD_LOGIC_VECTOR(7 downto 0);	 
		 addra : out STD_LOGIC_VECTOR(7 downto 0);
		 addrb : out STD_LOGIC_VECTOR(7 downto 0); 
		 addr1 : out STD_LOGIC_VECTOR(7 downto 0); 
		 error : out STD_LOGIC; 
		 res : out STD_LOGIC_VECTOR(7 downto 0)
	     );
end reed_sol_mull_div;

--}} End of automatically maintained section

architecture reed_sol_mull_div of reed_sol_mull_div is 
signal sm,sm1 : STD_LOGIC_VECTOR(8 downto 0) := (others => '0');  
signal md1 : std_logic;	   
signal z0,e0 :std_logic; 
begin
addra <= a;
addrb <= b;	 
process(clk,rst)
begin  
if rst = '1' then  
	sm1 <= (others => '0');
	md1 <= '0';
elsif clk = '1' and clk'event then	
	if  m_d = '0' then sm1 <=  ext(tabla0,9) + ext(tablb0,9) + 1;
	else sm1 <= ext(tabla0,9) - ext(tablb0,9);
	end if;
	md1 <= m_d;	  
	if a = x"00" or b = "00" then z0 <= '1'; else z0 <= '0'; end if;
	if m_d = '1' and  b = "00" then e0 <= '1'; else e0 <= '0'; end if;	
end if;
end process; 
sm <= sm1 + 0 when (md1 = '0' and  sm1(8) = '1')else 
	  sm1 - 1 when (md1 = '0' or  (md1 = '1' and  sm1(8) = '1')) else sm1 + 0;		  
addr1 <= sm(7 downto 0); 			
res <= x"00" when (z0 = '1') else 	tabl1; 	
 error <= e0;	

	 -- enter your statements here --

end reed_sol_mull_div;
					 