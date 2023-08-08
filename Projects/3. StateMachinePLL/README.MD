# StateMachinePLL Project

This repository contains a VHDL code implementation of a state machine that controls LEDs based on the state of input switches. The state machine is designed to run synchronously with a clock signal and utilizes a PLL (Phase-Locked Loop) to generate a 25 MHz clock from a 50 MHz input clock. This README provides an overview of the code's functionality, how to use it with Quartus Prime, and includes step-by-step instructions.

## Code Overview

The `StateMachinePLL` entity has the following ports:

- `rst`: Reset input signal.
- `clk`: A 50 MHz clock input.
- `sw`: A 4-bit vector representing input switches.
- `led`: A 4-bit vector controlling output LEDs.

The state machine has four states: `STATE1`, `STATE2`, `STATE3`, and `STATE4`. It cycles through these states based on the input switch conditions. The LED outputs are controlled according to the active state.

## PLL Implementation

The code includes a PLL instantiation (`PLL1`) to generate a 25 MHz clock (`clk_25mhz`) from the 50 MHz input clock (`clk`). The generated clock is used as a synchronous reference for the state machine.

## Running the Project with Quartus Prime

To run this VHDL project using Quartus Prime, follow these steps:

1. Open Quartus Prime.

2. Open the existing project that contains the `StateMachinePLL` VHDL code.

3. Follow these steps to configure the PLL for generating a 25 MHz clock from a 50 MHz input clock:

   ![Select IP](./img/select_ip.png)

   ![Add New IP Block](./img/add_new_ip_block_to_the_project.png)

   ![PLL Wizard - Speed Grade 8 - 50MHz](./img/alt_pll_wizzard_speed_grade_8_50mhz.png)

   ![Uncheck Create Locked Output](./img/uncheck_create_locked_output.png)

   ![PLL Bandwidth Auto](./img/pll_bw_auto.png)

   ![Uncheck Second Input Clock](./img/uncheck_second_input_clk.png)

   ![Do Not Need Dynamic PLL](./img/do_not_need_dynamic_pll.png)

   ![Set Clock Frequency to 25MHz](./img/set_clk_freq_25mhz.png)

   ![Skip Clock Configuration](./img/skip_clk1_clk2_clk3_clk4_configuration.png)

   ![PLL Wizard Summary](./img/pll_wizzard_summary_pll.cmp_pll_inst.vhd_checkbox.png)

   ![Saving IP PLL Directory](./img/ip_pll_saving_dir.png)

4. Assign the pins based on the image.
![Saving IP PLL Directory](./img/pin_assignments.png)

5. Compile and synthesize the design using Quartus Prime.

6. Program the compiled design onto your FPGA board.

Remember to adapt the code to your specific FPGA target and clock frequency requirements.

Feel free to modify and enhance the code to fit your needs or integrate it into a larger project.
