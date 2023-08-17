# Concurrent VHDL Statements
Note!
> Concurrent VHDL Statements: Can only be used inside the architecture block

> Sequential VHDL Statements: Can only be used inside the Process block


## Process block

## Component instantiation

## Concurrent signal Assignments (<=)

Syntax:

```vhdl
signal_name <= value_expression;
```

Example:

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ConcurrentAssignments is
    Port ( clk    : in STD_LOGIC;
           reset  : in STD_LOGIC;
           signal_a : out STD_LOGIC;
           signal_b : out STD_LOGIC);
end ConcurrentAssignments;

architecture Behavioral of ConcurrentAssignments is
begin
    -- Concurrent signal assignments
    signal_a <= clk and not reset;
    signal_b <= not clk or reset;
end Behavioral;
```

## Conditional Signal Assignment (when-else)

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ConditionalAssignmentTernary is
    Port ( B : in  STD_LOGIC_VECTOR(1 downto 0);
           A : out  STD_LOGIC_VECTOR(2 downto 0));
end ConditionalAssignmentTernary;

architecture Behavioral of ConditionalAssignmentTernary is
begin
    A <= "100" when B = "00" else
         "010" when B = "01" else
         "001" when B = "10" else
         "000"; -- Default value when none of the conditions match
end Behavioral;
```

## Selected Signal Assignment (with - select)

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SelectedAssignmentExample2 is
    Port ( B : in  STD_LOGIC_VECTOR(1 downto 0);
           A : out  STD_LOGIC_VECTOR(3 downto 0));
end SelectedAssignmentExample2;

architecture Behavioral of SelectedAssignmentExample2 is
begin
    with B select
        A <= "1000" when "00",
             "0100" when "01",
             "0010" when "10",
             "0001" when others;
end Behavioral;
```

## Generate

> Can be used to create:
> 
- Component instances
- Signal Assignments
- Process blocks

### Replicate hardware (`for` generate)

> **`generate`** statement is used to replicate hardware structures or components.
> 

Syntax:

```vhdl
Label: for parameter in range generate
   -- Hardware to generate
end generate;
```

Example1:

```vhdl
for n in 0 to 19 generate
	MyCComponent : EntityA
	port map
	(
		A => Signal1(n),
		B => Signal2(n),
		C => Sum(n)
	);
end generate;
```
#

In this example, we have an entity named **`ReplicateHardwareExample`** with an input signal **`input`** of type **`STD_LOGIC`** and an output signal **`output`** of the same type.

The architecture **`Behavioral`** demonstrates the use of the **`generate`** statement to replicate instances of AND gates based on different conditions of the input signal. 
Depending on the value of **`input`**, different instances of AND gates are generated, each producing a different value for the **`output`** signal.
Example2:

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ReplicateHardwareExample is
    Port ( input : in  STD_LOGIC;
           output : out  STD_LOGIC);
end ReplicateHardwareExample;

architecture Behavioral of ReplicateHardwareExample is
begin
    -- Generate four instances of AND gates
    generate
        gen_AND1: if input = '1' generate
            output <= '1';
        end generate;

        gen_AND2: if input = '0' generate
            output <= '0';
        end generate;

        gen_AND3: if input = '1' generate
            output <= '1';
        end generate;

        gen_AND4: if input = '0' generate
            output <= '0';
        end generate;
    end generate;
end Behavioral;
```

### Conditional hardware (`if` generate)

Syntax:

```vhdl
Label : if condition1 generate
-- Hardware to generate on condition 1.
elsif condition2 generate
-- Hardware to generate on condition 2.
else generate
-- Hardware to generate if all conditions false.
end generate;
```

Example1:

```vhdl
if ASSIGN_TO_Y generate
	Y <= X;
else generate
	Z <= X;
end generate;
```

Example2:

```vhdl
if ENABLE_REGISTER generate
	Reg : process(clk)
	begin
		if rising_edge(clk) then
			Y <= X;
		end if;
	end process;
else generate
	Y <= X;
end generate;
```

