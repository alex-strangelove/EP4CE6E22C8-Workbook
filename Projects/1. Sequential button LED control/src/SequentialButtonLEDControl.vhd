library ieee;
use ieee.std_logic_1164.all;

entity SequentialButtonLEDControl is
port
(
    sw  : in std_logic_vector(4 downto 1);
    led : out std_logic_vector(4 downto 1)
);
end entity;

architecture rtl of SequentialButtonLEDControl is
begin
    led(1) <= sw(1);
	 led(2) <= sw(2);
	 led(3) <= sw(3);
	 led(4) <= sw(4);
end architecture;