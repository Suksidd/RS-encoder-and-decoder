-- dff.vhd


	

		library ieee;
		use ieee.std_logic_1164.all;
		use ieee.std_logic_unsigned.all;
		use ieee.std_logic_arith.all;

		entity dff is
		port (din : in std_logic_vector(7 downto 0);
			clear, clock, enable : in std_logic;
			q : out std_logic_vector (7 downto 0)); 
		end dff;

--       
--        
        architecture behav of dff is
		
--        --

		
		begin  
		process (enable, clock, clear)
	  		begin
	  		if (clear = '0') then
				q <= "00000000";
			elsif  (clock'event and clock = '1')  
            then
				if (enable = '1') then
			   	q <= din;
				end if;
			end if;
	 		end process;
		end behav;


