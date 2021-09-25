-- rs255.vhd

-- rs255.vhd
		library ieee;
		use ieee.std_logic_1164.all;
		use ieee.std_logic_unsigned.all;
		use ieee.std_logic_arith.all;

		entity rs_255_239 is
		port(clear, clock, enable : in  std_logic;
            rs_sel_slt     : in  std_logic; -- RS data slot
			input         : in  std_logic_vector(7 downto 0); -- input data  
			output             : out std_logic_vector(7 downto 0)  -- output mx with input and rsparity
			);
		end rs_255_239;


        
		architecture behav of rs_255_239 is
   
		signal s_p1: std_logic_vector(7 downto 0);
		signal s_p2: std_logic_vector(7 downto 0);
		signal s_p3: std_logic_vector(7 downto 0); 
		signal s_p4: std_logic_vector(7 downto 0);
		signal s_p5: std_logic_vector(7 downto 0);
    	signal s_p6: std_logic_vector(7 downto 0);
    	signal s_p7: std_logic_vector(7 downto 0);
    	signal s_p8: std_logic_vector(7 downto 0);
        signal s_p9: std_logic_vector(7 downto 0);
        signal s_p10: std_logic_vector(7 downto 0);
        signal s_p11: std_logic_vector(7 downto 0);
        signal s_p12: std_logic_vector(7 downto 0);
        signal s_p13: std_logic_vector(7 downto 0);
        signal s_p14: std_logic_vector(7 downto 0);
        signal s_p15: std_logic_vector(7 downto 0);
        signal s_p16: std_logic_vector(7 downto 0);
        signal feed    : std_logic_vector(7 downto 0) := "00000001";
        signal gen    : std_logic_vector(7 downto 0);
        signal ph    : std_logic_vector(7 downto 0);
        signal en_res : std_logic_vector(1 downto 0);
        
 
		component ma1_1e 
			port(clear, clock, enable : in std_logic;
				ma1_1e_in : in std_logic_vector(7 downto 0);
				ma1_1e_out : out std_logic_vector(7 downto 0)
				);
		end component;
   
		component ma165_2e 
			port(clear, clock, enable : in std_logic;
				ma165_2e_in : in std_logic_vector(7 downto 0);
				si : in std_logic_vector(7 downto 0);
				ma165_2e_out : out std_logic_vector(7 downto 0)
				);
		end component;


        component ma105_3e 
			port(clear, clock, enable : in std_logic;
				ma105_3e_in : in std_logic_vector(7 downto 0);
				si : in std_logic_vector(7 downto 0);
				ma105_3e_out : out std_logic_vector(7 downto 0)
				);
		end component;
    
      component ma27_4e 
			port(clear, clock, enable : in std_logic;
				ma27_4e_in : in std_logic_vector(7 downto 0);
				si : in std_logic_vector(7 downto 0);
				ma27_4e_out : out std_logic_vector(7 downto 0)
				);
		end component;

        component ma159_5e 
			port(clear, clock, enable : in std_logic;
				ma159_5e_in : in std_logic_vector(7 downto 0);
				si : in std_logic_vector(7 downto 0);
				ma159_5e_out : out std_logic_vector(7 downto 0)
				);
		end component;

        component ma104_6e 
			port(clear, clock, enable : in std_logic;
				ma104_6e_in : in std_logic_vector(7 downto 0);
				si : in std_logic_vector(7 downto 0);
				ma104_6e_out : out std_logic_vector(7 downto 0)
				);
		end component;

        component ma152_7e 
			port(clear, clock, enable : in std_logic;
				ma152_7e_in : in std_logic_vector(7 downto 0);
				si : in std_logic_vector(7 downto 0);
				ma152_7e_out : out std_logic_vector(7 downto 0)
				);
		end component;

        component ma101_8e 
			port(clear, clock, enable : in std_logic;
				ma101_8e_in : in std_logic_vector(7 downto 0);
				si : in std_logic_vector(7 downto 0);
				ma101_8e_out : out std_logic_vector(7 downto 0)
				);
		end component;

        component ma74_9e 
			port(clear, clock, enable : in std_logic;
				ma74_9e_in : in std_logic_vector(7 downto 0);
				si : in std_logic_vector(7 downto 0);
				ma74_9e_out : out std_logic_vector(7 downto 0)
				);
		end component;

        component ma101_10e 
			port(clear, clock, enable : in std_logic;
				ma101_10e_in : in std_logic_vector(7 downto 0);
				si : in std_logic_vector(7 downto 0);
				ma101_10e_out : out std_logic_vector(7 downto 0)
				);
		end component;

        component ma152_11e 
			port(clear, clock, enable : in std_logic;
				ma152_11e_in : in std_logic_vector(7 downto 0);
				si : in std_logic_vector(7 downto 0);
				ma152_11e_out : out std_logic_vector(7 downto 0)
				);
		end component;

        component ma104_12e 
			port(clear, clock, enable : in std_logic;
				ma104_12e_in : in std_logic_vector(7 downto 0);
				si : in std_logic_vector(7 downto 0);
				ma104_12e_out : out std_logic_vector(7 downto 0)
				);
		end component;

        component ma159_13e 
			port(clear, clock, enable : in std_logic;
				ma159_13e_in : in std_logic_vector(7 downto 0);
				si : in std_logic_vector(7 downto 0);
				ma159_13e_out : out std_logic_vector(7 downto 0)
				);
		end component;

        component ma27_14e 
			port(clear, clock, enable : in std_logic;
				ma27_14e_in : in std_logic_vector(7 downto 0);
				si : in std_logic_vector(7 downto 0);
				ma27_14e_out : out std_logic_vector(7 downto 0)
				);
		end component;

        component ma105_15e 
			port(clear, clock, enable : in std_logic;
				ma105_15e_in : in std_logic_vector(7 downto 0);
				si : in std_logic_vector(7 downto 0);
				ma105_15e_out : out std_logic_vector(7 downto 0)
				);
		end component;

        component ma165_16e 
			port(clear, clock, enable : in std_logic;
				ma165_16e_in : in std_logic_vector(7 downto 0);
				si : in std_logic_vector(7 downto 0);
				ma165_16e_out : out std_logic_vector(7 downto 0)
				);
		end component;


		component adder 
			port (adder_ina, adder_inb : in std_logic_vector(7 downto 0);
				adder_outy : out std_logic_vector (7 downto 0)); 
		end component;

        

		begin

                 
        
    
		u1: ma1_1e 
		port map (clear => clear, clock => clock, enable => enable,
			ma1_1e_in => feed,
			ma1_1e_out => s_p1);

      
      
		u2: ma165_2e 
		port map (clear => clear, clock => clock, enable => enable,
			ma165_2e_in => feed,
			si => s_p1,
			ma165_2e_out => s_p2);

         
  
		u3: ma105_3e 
		port map (clear => clear, clock => clock, enable => enable,
			ma105_3e_in => feed,
			si => s_p2,
			ma105_3e_out => s_p3);
        
      
  
		U4: ma27_4e 
		port map (clear => clear, clock => clock, enable => enable,
			ma27_4e_in => feed,
			si => s_p3,
			ma27_4e_out => s_p4);

        
  
		u5: ma159_5e 
		port map (clear => clear, clock => clock, enable => enable,
			ma159_5e_in => feed,
			si => s_p4,
			ma159_5e_out => s_p5);

        

		u6: ma104_6e 
		port map (clear => clear, clock => clock, enable => enable,
			ma104_6e_in => feed,
			si => s_p5,
			ma104_6e_out => s_p6);

        
  
		u7: ma152_7e 
		port map (clear => clear, clock => clock, enable => enable,
			ma152_7e_in => feed,
			si => s_p6,
			ma152_7e_out => s_p7);


        u8: ma101_8e 
		port map (clear => clear, clock => clock, enable => enable,
			ma101_8e_in => feed,
            	si => s_p7,
			ma101_8e_out => s_p8);

      
      
		u9: ma74_9e 
		port map (clear => clear, clock => clock, enable => enable,
			ma74_9e_in => feed,
			si => s_p8,
			ma74_9e_out => s_p9);

         
  
		u10: ma101_10e 
		port map (clear => clear, clock => clock, enable => enable,
			ma101_10e_in => feed,
			si => s_p9,
			ma101_10e_out => s_p10);
        
      
  
		U11: ma152_11e 
		port map (clear => clear, clock => clock, enable => enable,
			ma152_11e_in => feed,
			si => s_p10,
			ma152_11e_out => s_p11);

        
  
		u12: ma104_12e 
		port map (clear => clear, clock => clock, enable => enable,
			ma104_12e_in => feed,
			si => s_p11,
			ma104_12e_out => s_p12);

        

		u13: ma159_13e 
		port map (clear => clear, clock => clock, enable => enable,
			ma159_13e_in => feed,
			si => s_p12,
			ma159_13e_out => s_p13);

        
  
		u14: ma27_14e 
		port map (clear => clear, clock => clock, enable => enable,
			ma27_14e_in => feed,
			si => s_p13,
			ma27_14e_out => s_p14);

       	u15: ma105_15e 
		port map (clear => clear, clock => clock, enable => enable,
			ma105_15e_in => feed,
			si => s_p14,
			ma105_15e_out => s_p15);

		u16: ma165_16e 
		port map (clear => clear, clock => clock, enable => enable,
			ma165_16e_in => feed,
			si => s_p15,
			ma165_16e_out => s_p16);

			ph <=s_p16;

		u17: adder 
		port map (adder_ina => ph, adder_inb => input,
			adder_outy => gen); 


         u18: process(input,ph,rs_sel_slt)
            begin
                if(rs_sel_slt = '1') then
                  output <= input;
                else
                  output <= ph;
                end if;
            end process;
            
         en_res <= '1' & rs_sel_slt; --enable
        u19: process(gen,en_res)
             begin
               case en_res is
                 --when "00"    => feed <= "00000000";
                 --when "01"    => feed <= "00000000";   
                 when "11"    => feed <= gen;
                 --when "10"    => feed <= "00000000"; 
                 when others  => feed <= "00000000";  
               end case; 
             
             end process;    


             
                    
                

  
		end behav;

