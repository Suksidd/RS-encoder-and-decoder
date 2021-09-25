-- ma165_16e.vhd

library ieee;
		use ieee.std_logic_1164.all;
		use ieee.std_logic_unsigned.all;
		use ieee.std_logic_arith.all;
		entity ma165_16e is
 		port(clear, clock, enable : in std_logic;
			ma165_16e_in : in std_logic_vector(7 downto 0);
			si : in std_logic_vector(7 downto 0);
			ma165_16e_out : out std_logic_vector(7 downto 0)
			);
		end ma165_16e;

		architecture behav of ma165_16e is
		signal sig_ma165_16e_y: std_logic_vector(7 downto 0);
		signal sig_adder_y: std_logic_vector(7 downto 0);

		component multi165
			port(a: in std_logic_vector(7 downto 0);
	     		y : out std_logic_vector(7 downto 0)	
				);
		end component;

		component adder
			port(adder_ina : in std_logic_vector(7 downto 0);
	     		adder_inb : in std_logic_vector(7 downto 0);
	     		adder_outy : out std_logic_vector(7 downto 0)
				);
		end component; 

		component dff
			port(clear, clock, enable : in std_logic;
				din : in std_logic_vector(7 downto 0);
	    		q : out std_logic_vector(7 downto 0)
				);
		end component;
		begin
		u1: multi165
		port map( a => ma165_16e_in,
	    	 y => sig_ma165_16e_y);
		u2: adder
		port map( adder_ina => sig_ma165_16e_y,
		  	adder_inb => si,
	    	  adder_outy => sig_adder_y); 
		u3: dff
		port map( clear => clear,
		  clock => clock,
		  enable => enable,
	      din => sig_adder_y,
		  q => ma165_16e_out); 
 		end behav;