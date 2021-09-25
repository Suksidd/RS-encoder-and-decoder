-- adder.vhd

--mod-2 adderer

		library ieee;
		use ieee.std_logic_1164.all;
		use ieee.std_logic_unsigned.all;
		use ieee.std_logic_arith.all;

		entity adder is
		port (adder_ina, adder_inb : in std_logic_vector(7 downto 0);
	   		adder_outy : out std_logic_vector (7 downto 0)); 
		end adder;

		architecture rtl of adder is
		begin  
		
		  adder_outy <= adder_ina xor adder_inb;
	  
		end rtl;