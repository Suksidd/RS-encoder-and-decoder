-- ma1_1e.vhd
-- ma1_1e.vhd

		    
		library ieee;
		use ieee.std_logic_1164.all;
		use ieee.std_logic_unsigned.all;
		use ieee.std_logic_arith.all;
		entity ma1_1e is
 		port(clear, clock, enable : in std_logic;
			ma1_1e_in : in std_logic_vector(7 downto 0);
			
			ma1_1e_out : out std_logic_vector(7 downto 0)
			);
		end ma1_1e;

		architecture behav of ma1_1e is
		signal sig_ma1_1e_y: std_logic_vector(7 downto 0);
		

		component multi1
			port(a: in std_logic_vector(7 downto 0);
	     		y : out std_logic_vector(7 downto 0)	
				);
		end component;

		

		component dff
			port(clear, clock, enable : in std_logic;
				din : in std_logic_vector(7 downto 0);
	    		q : out std_logic_vector(7 downto 0)
				);
		end component;
		begin
		u1: multi1
		port map( a => ma1_1e_in,
	    	 y => sig_ma1_1e_y);
		 
		u2: dff
		port map( clear => clear,
		  clock => clock,
		  enable => enable,
	      din => sig_ma1_1e_y,
		  q => ma1_1e_out); 
 		end behav;

