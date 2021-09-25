
-- intr8.vhd


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity intr8_rs255 is
	port(res           : in  std_logic;
         clock            : in  std_logic;
         Nclock            : in  std_logic;
         input         : in  std_logic_vector(7 downto 0); --8 bit parallel data
         dataslt      : in  std_logic; --  Data slot 239*5 clock width
         finalout:out std_logic_vector(7 downto 0)  -- output mx with all outs 
            );
end intr8_rs255;

architecture behav of intr8_rs255 is

signal enable : std_logic ;
signal out1,out2,out3,out4,out5,out6,out7,out8   : std_logic_vector(7 downto 0); 
signal in1,in11 ,in12 ,in13,in14 ,in15 ,in16 ,in17  :std_logic_vector(7 downto 0);
signal in2 ,in21 ,in22 , in23 , in24 , in25 ,in26 :std_logic_vector(7 downto 0);
signal in3, in31,in32,in33,in34,in35 :std_logic_vector(7 downto 0);
signal in4 ,in41 ,in42 ,in43,in44 :std_logic_vector(7 downto 0);
signal in5 ,in51 ,in52,in53 :std_logic_vector(7 downto 0);
signal in6 ,in61,in62:std_logic_vector(7 downto 0);
signal  in7,in71:std_logic_vector(7 downto 0);
signal in8 :std_logic_vector(7 downto 0);
signal outcnt1 : std_logic_vector(3 downto 0) :="0000";



component rs_255_239 is
		port(clear, clock, enable : in  std_logic;
            rs_sel_slt     : in  std_logic; -- RS parity slot
			input         : in  std_logic_vector(7 downto 0); -- input data  
			output             : out std_logic_vector(7 downto 0)  -- output mx with input and rsparity
			);
end component rs_255_239;



begin

----enable process


enable1 : process(res,clock)

begin 

        if (res ='0') then 

               enable <= '0';

        elsif clock = '1' and clock'event

        then   


                enable <= '1';

        end if;
end process;



---- counter process (count = 1 to 8)


pcount : process(res,clock)

begin 


        if  res = '0'  then
    
                outcnt1 <= "0000";

       elsif(clock='1' and clock'event) 
        then
 
              if outcnt1 = "1000" then 
                        outcnt1 <= "0001" ;
              else 
                    outcnt1 <= outcnt1 + "0001";

              end if;   

        end if;
end process;



----input the data  



pin1:process(res,clock,outcnt1)


begin

if(res='0')  then
            
        in1<="00000000";
           
            
elsif(clock='1' and clock'event) 
    then
 
           if(outcnt1 ="0001") then
                    
                in1<=input;
                   
           end if; 
end if;
end process;



pin2:process(res,clock,outcnt1)


begin

if(res='0')then
            
     in2<="00000000";
           
elsif(clock='1' and clock'event) 
 then
             
     if(outcnt1 ="0010") then
                    
          in2<=input;
                                    
     end if;  
                    
end if;
end process;



pin3:process(res,clock,outcnt1)


begin

if(res='0')then
            
   in3<="00000000";
           
elsif(clock='1' and clock'event) 
then
 
    if(outcnt1 ="0011") then
                    
         in3<=input;
    end if;
                  
end if;
end process;




pin4:process(res,clock,outcnt1)


begin

if(res='0')then
            
  in4<="00000000";
           
elsif(clock='1' and clock'event) 
then
 
    if(outcnt1 ="0100") then
                    
                    in4<=input;
    end if;
       
end if;
end process;



pin5:process(res,clock,outcnt1)


begin

if(res='0')then
            
  in5<="00000000";
           
elsif(clock='1' and clock'event) 
then
 
        if(outcnt1 ="0101") then
 
            in5<=input;
                    
        end if;

end if;
end process;

pin6:process(res,clock,outcnt1)


begin

if(res='0')then
            
  in6<="00000000";
           
elsif(clock='1' and clock'event) 
then
 
        if(outcnt1 ="0110") then
 
            in6<=input;
                    
        end if;

end if;
end process;

pin7:process(res,clock,outcnt1)


begin

if(res='0')then
            
  in7<="00000000";
           
elsif(clock='1' and clock'event) 
then
 
        if(outcnt1 ="0111") then
 
            in7<=input;
                    
        end if;

end if;
end process;

pin8:process(res,clock,outcnt1)


begin

if(res='0')then
            
  in8<="00000000";
           
elsif(clock='1' and clock'event) 
then
 
        if(outcnt1 ="1000") then
 
            in8<=input;
                    
        end if;

end if;
end process;




-----latching  all the input 


platch: process(res,clock)

begin 
   
if  res = '0' then

             in11<= "00000000"; 
             in12<= "00000000";
             in13<= "00000000";
             in14<= "00000000";
             in15<= "00000000";
             in16<= "00000000";
             in17<= "00000000";

             in21<= "00000000"; 
             in22<= "00000000";
             in23<= "00000000";
             in24<= "00000000";
             in25<= "00000000";
             in26<= "00000000";
             
             in31<= "00000000"; 
             in32<= "00000000";
             in33<= "00000000";
             in34<= "00000000";
             in35<= "00000000";
             
             in41 <= "00000000";
             in42 <= "00000000";
             in43 <= "00000000";
             in44 <= "00000000";

             in51 <= "00000000";
             in52 <= "00000000";
             in53 <= "00000000";

             in61 <= "00000000";                    
             in62 <= "00000000";
            
             in71 <= "00000000";      

elsif(clock ='1' and clock'event )
then


                    
                    in11<=in1;
                    in12<=in11;
                    in13<=in12;
                    in14<=in13;
                    in15<=in14;
                    in16<=in15;
                    in17<=in16;
                    
                    in21<=in2;
                    in22<=in21;
                    in23<=in22;
                    in24<=in23;
                    in25<=in24;
                    in26<=in25;

                    in31<=in3;
                    in32<=in31;
                    in33<=in32;
                    in34<=in33;
                    in35<=in34;
                                  
                    in41 <= in4;
                    in42 <= in41;
                    in43 <= in42;
                    in44 <= in43;

                    in51 <= in5;
                    in52 <= in51;
                    in53 <= in52;


                    in61 <= in6;
                    in62 <= in61;


                    in71 <= in7;
  
  
end if;
end process;                 


---- input to encoder



TRSu1:rs_255_239 port map (clear => res, clock => Nclock, enable => enable,rs_sel_slt => dataslt,input => in17,output => out1);
TRSu2:rs_255_239 port map (clear => res, clock => Nclock, enable => enable,rs_sel_slt => dataslt,input => in26,output => out2);
TRSu3:rs_255_239 port map (clear => res, clock => Nclock, enable => enable,rs_sel_slt => dataslt,input => in35,output => out3);
TRSu4:rs_255_239 port map (clear => res, clock => Nclock, enable => enable,rs_sel_slt => dataslt,input => in44,output => out4);
TRSu5:rs_255_239 port map (clear => res, clock => Nclock, enable => enable,rs_sel_slt => dataslt,input => in53,output => out5);
TRSu6:rs_255_239 port map (clear => res, clock => Nclock, enable => enable,rs_sel_slt => dataslt,input => in62,output => out6);
TRSu7:rs_255_239 port map (clear => res, clock => Nclock, enable => enable,rs_sel_slt => dataslt,input => in71,output => out7);
TRSu8:rs_255_239 port map (clear => res, clock => Nclock, enable => enable,rs_sel_slt => dataslt,input => in8,output => out8);


----outcnt1 is 1 to 8.
----output interface.
---- finalout is final interleaver output.
p1:process(res,clock)


variable outcnt1 : std_logic_vector(3 downto 0) :="0000";


begin
  
if(res='0')then
            
   outcnt1:="0000";
   finalout <="00000000";

    
elsif(clock='1' and clock'event) 
then
     outcnt1:=outcnt1+1;
            
      if(outcnt1 ="0001") then
                    
           finalout <= out1;
                  
      elsif  (outcnt1="0010") then
                    
           finalout <= out2;
                    
      elsif (outcnt1="0011") then
                    
           finalout <= out3;
                    
      elsif  (outcnt1="0100") then
                    
           finalout <= out4;
                    
      elsif (outcnt1="0101") then
                    
           finalout <= out5;

      elsif (outcnt1="0110") then
                    
           finalout <= out6;

      elsif (outcnt1="0111") then
                    
           finalout <= out7;

       elsif (outcnt1="1000") then
                    
           finalout <= out8;
                    
      elsif outcnt1 > "1000" then
           
           outcnt1 := "0001";
           

      end if;
            
              
end if;
end process;




end behav;




