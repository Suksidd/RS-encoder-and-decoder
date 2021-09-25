-- ma74_9e.vhd



library ieee;
		use ieee.std_logic_1164.all;
		use ieee.std_logic_unsigned.all;
		use ieee.std_logic_arith.all;
		entity ma74_9e is
 		port(clear, clock, enable : in std_logic;
			ma74_9e_in : in std_logic_vector(7 downto 0);
			si : in std_logic_vector(7 downto 0);
			ma74_9e_out : out std_logic_vector(7 downto 0)
			);
		end ma74_9e;

		architecture behav of ma74_9e is
		signal sig_ma74_9e_y: std_logic_vector(7 downto 0);
		signal sig_adder_y: std_logic_vector(7 downto 0);

		component multi74
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
		u1: multi74
		port map( a => ma74_9e_in,
	    	 y => sig_ma74_9e_y);
		u2: adder
		port map( adder_ina => sig_ma74_9e_y,
		  	adder_inb => si,
	    	  adder_outy => sig_adder_y); 
		u3: dff
		port map( clear => clear,
		  clock => clock,
		  enable => enable,
	      din => sig_adder_y,
		  q => ma74_9e_out); 
 		end behav;