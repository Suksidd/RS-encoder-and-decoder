-- multi1.vhd
-- multi1.vhd

-- multi1.vhd

library ieee;
		use ieee.std_logic_1164.all;
		use ieee.std_logic_unsigned.all;
		use ieee.std_logic_arith.all;

		entity multi1 is
		port (A : in std_logic_vector(7 downto 0);
      		Y : out std_logic_vector(7 downto 0));
		end multi1;

--       
--        
        
	
	    architecture behav of multi1 is
--        
	
        


		signal YA :  std_logic_vector(7 downto 0);
		signal YB :  std_logic_vector(7 downto 0);
		signal YC :  std_logic_vector(7 downto 0);
		signal YD :  std_logic_vector(7 downto 0);
        signal YE :  std_logic_vector(7 downto 0);
        signal YF :  std_logic_vector(7 downto 0);
        signal YG :  std_logic_vector(7 downto 0);
        signal YH :  std_logic_vector(7 downto 0);
		

        


		begin
  		process(A)
			begin
	  		if (A(0) = '0') then
	   			YA <= "00000000";
	  		else
		        YA <= "00000001";
	  		end if;

	  	    if (A(1) = '0') then
	   	    	YB <= "00000000";
		    else
	   	        YB <= "00000010";
	  	    end if;

	  	    if (A(2) = '0') then
		        YC <= "00000000";
	  	    else
		        YC <= "00000100";
	  	    end if;

		    if (A(3) = '0') then
	   		    YD <= "00000000";
		    else
	   	        YD <= "00001000";
	  	    end if;
            
            if (A(4) = '0') then
	   		    YE <= "00000000";
		    else
	   	        YE <= "00010000";
	  	    end if;
            
            if (A(5) = '0') then
	   		    YF <= "00000000";
		    else
	   	        YF <= "00100000";
	  	    end if;
            
            if (A(6) = '0') then
	   		    YG <= "00000000";
		    else
	   	        YG <= "01000000";
	  	    end if;
            
            if (A(7) = '0') then
	   		    YH <= "00000000";
		    else
	   	        YH <= "10000000";
	  	    end if;    
	  	    
		    
    	end process;

		 Y <= YA xor YB xor YC xor YD xor YE xor YF xor YG xor YH;

	 end behav;