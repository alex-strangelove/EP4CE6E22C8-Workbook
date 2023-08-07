library ieee;
use ieee.std_logic_1164.all;

entity StateMachine is
port
(
	--Clock input, implement as a synchronous state machine
	clk	: in std_logic;
	
	--	Define switch ports using std_vector
	sw		: in std_logic_vector(4 downto 1);
	
	--	Define led ports using std_vector
	led	: out std_logic_vector(4 downto 1)
	
);
end entity;

architecture rtl of StateMachine is
--Define state machine datatype
type SMDataType is (STATE1, STATE2, STATE3, STATE4);

--Define state variable, with type of SMDataType
signal State : SMDataType;

begin
	--	Define sync process
	process(clk)
	begin
		--Catch rising edge of the clock signal
		if rising_edge(clk) then
		--Everything below here will be implemented as register aka flip-flop:
		
		--	Switch/case selector
			case State is
				when STATE1 =>
					led <= "1110";
					if sw(1) = '0' then
						State <= STATE2;
					end if;
						
				when STATE2 =>
					led <= "1101";
						if sw(2) = '0' then
						State <= STATE3;
					end if;
						
				when STATE3 =>
					led <= "1011";
						if sw(3) = '0' then
						State <= STATE4;
					end if;
					
				when STATE4 =>
					led <= "0111";
						if sw(4) = '0' then
						State <= STATE1;
					end if;
				
				--Default state (STATE1)
				when others =>
					State <= STATE1;
			end case;	
			
		end if;
	end process;
end rtl;