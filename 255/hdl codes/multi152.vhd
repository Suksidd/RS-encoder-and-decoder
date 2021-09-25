-- multi152.vh


library ieee;
		use ieee.std_logic_1164.all;
		use ieee.std_logic_unsigned.all;
		use ieee.std_logic_arith.all;

		entity multi152 is
		port (A : in std_logic_vector(7 downto 0);
      		Y : out std_logic_vector(7 downto 0));
		end multi152;

       
      
        
	
	    architecture behav of multi152 is
      
	
       


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
		        YA <= "10011000";
	  		end if;

	  	    if (A(1) = '0') then
	   	    	YB <= "00000000";
		    else
	   	        YB <= "10110111";
	  	    end if;

	  	    if (A(2) = '0') then
		        YC <= "00000000";
	  	    else
		        YC <= "11101001";
	  	    end if;

		    if (A(3) = '0') then
	   		    YD <= "00000000";
		    else
	   	        YD <= "01010101";
	  	    end if;
            
            if (A(4) = '0') then
	   		    YE <= "00000000";
		    else
	   	        YE <= "10101010";
	  	    end if;
            
            if (A(5) = '0') then
	   		    YF <= "00000000";
		    else
	   	        YF <= "11010011";
	  	    end if;
            
            if (A(6) = '0') then
	   		    YG <= "00000000";
		    else
	   	        YG <= "00100001";
	  	    end if;
            
            if (A(7) = '0') then
	   		    YH <= "00000000";
		    else
	   	        YH <= "01000010";
	  	    end if;    
	  	    
		    
    	end process;

		 Y <= YA xor YB xor YC xor YD xor YE xor YF xor YG xor YH;

	 end behav;