library ieee;
use ieee.std_logic_1164.all;

entity StateMachinePLL is
port
(
	--	Define reset push button
	rst	: in std_logic;
	
	--Clock input, implement as a synchronous state machine
	clk	: in std_logic; -- 50Mhz
	
	--	Define switch ports using std_vector
	sw		: in std_logic_vector(4 downto 1);
	
	--	Define led ports using std_vector
	led	: out std_logic_vector(4 downto 1)
	
);
end entity;

architecture rtl of StateMachinePLL is

--Instantiate PLL component
component PLL is
	port
	( 
		areset		: IN STD_LOGIC  := '0'; -- Analog reset signal
		inclk0		: IN STD_LOGIC  := '0';
		c0				: OUT STD_LOGIC 
	);
end component;

--Define state machine datatype
type SMDataType is (STATE1, STATE2, STATE3, STATE4);

--Define state variable, with type of SMDataType
signal State : SMDataType;

--Define signal output clock
signal clk_25mhz	: std_logic;

begin
	-- Its OK to have more than one PLL instance
	-- Instantiate PLL as PLL1
	PLL1:PLL
	port map
	(
		areset		=> not(rst),-- Analog reset signal
		inclk0		=> clk, -- 50Mhz
		c0				=> clk_25mhz -- 25Mhz
	);
		
	--	Define sync process
	process(rst, clk_25mhz)
	begin
		--	Check reset condition, and if not asserted listen to clk raise condition 
		if rst = '0' then
			State <= STATE1;
			led <= "1111"; -- Disabled all LED's
		
		--Catch rising edge of the clock signal
		elsif rising_edge(clk_25mhz) then
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