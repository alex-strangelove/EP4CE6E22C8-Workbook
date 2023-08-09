# FPGA Design Visualization and Analysis

This tool provides a comprehensive way to visualize and analyze FPGA designs using Quartus Prime. It offers insights into various aspects of your project, such as RTL implementation, state machines, logic cells, and resource utilization. Follow the steps below to effectively utilize this tool.

## Table of Contents

1. [RTL Viewer](#rtl-viewer)
2. [State Machine Visualization](#state-machine-visualization)
3. [Detailed Schematic View](#detailed-schematic-view)
4. [Path Tracing](#path-tracing)
5. [Primitive Block Navigation](#primitive-block-navigation)
6. [Register Connections](#register-connections)
7. [Combinational Logic Analysis](#combinational-logic-analysis)
8. [State Variables as Registers](#state-variables-as-registers)
9. [Logic Cell to Flip-Flop Properties](#logic-cell-to-flip-flop-properties)
10. [AND Gate Example](#and-gate-example)
11. [Fitter Summary](#fitter-summary)
12. [Fitter Settings](#fitter-settings)
13. [Resource Usage Summary](#resource-usage-summary)
14. [Pin Configuration](#pin-configuration)
15. [PLL Configuration](#pll-configuration)
16. [Resource Utilization by Entity](#resource-utilization-by-entity)
17. [Control Signals](#control-signals)
18. [Global and Fast Signals](#global-and-fast-signals)
19. [Contributing](#contributing)
20. [License](#license)

## RTL Viewer

![RTL Viewer](./img/open_rtl_viewer.png)

- The RTL viewer provides a high-level block diagram of the VHDL code implementation.
- Inputs are typically on the left, and outputs are on the right.
- Observe registers (~reg) before the output (Q pinoyt).
- Ports inside the `vhdl process(clk)` are considered flip-flops.
- The diagram features a PLL block with inputs `rst`, `clk`, and an output `clk`.

## State Machine Visualization

![State Machine Visualization](./img/click_on_state_block.png)

- Clicking on the State object recognizes it as a state machine.
- Follow state transitions to ensure your state diagram is correct.

## Detailed Schematic View

![Detailed Schematic View](./img/click_on_technology_map_viewer_post_fitting.png)

- Open the detailed schematic view for intricate design analysis.

## Path Tracing

- Trace signal paths by referring to ![clk_in_io_buffer.png](./img/clk_in_io_buffer.png) and ![rst_in_clkctrl.png](./img/rst_in_clkctrl.png) images.

## Primitive Block Navigation

![Primitive Block Navigation](./img/net_list_navigator_io_buf_block.png)

- Navigate primitive blocks using the left-side netlist navigator.

## Register Connections

![Register Connections](./img/register_out_to_led_via_io_buffer.png)

- Registers do not directly drive LEDs; IO_BUFFER is used in between.

## Combinational Logic Analysis

![Combinational Logic Analysis](./img/comb_logic_sells_to_registers.png)

- Observe D-input to registers driven by combinational logic cells.

## State Variables as Registers

![State Variables as Registers](./img/state_variable_on_diargam_as_register.png)

- State variables like `STATE1`, `STATE2`, etc., are treated as registers.

## Logic Cell to Flip-Flop Properties

![Logic Cell to Flip-Flop Properties](./img/comb_cell_to_flip-flop_props.png)

- Examine properties of the combination cell with 4 inputs (`DATA A`, `B`, `C`, `D`) and a `COMB` output.

## AND Gate Example

![AND Gate Example](./img/comb_cell_to_and_gate_example.png)

- Example of an AND gate using `LOGIC_CELL_COMB`.

## Fitter Summary

![Fitter Summary](./img/fitter_report_total_logic_elements.png)

- Review logic elements, registers, pins, memory bits, and PLL utilization.

## Fitter Settings

![Fitter Settings](./img/fitter_report_settings.png)

- View default and actual settings in Fitter.

## Resource Usage Summary

![Resource Usage Summary](./img/fitter_report_usage_summary.png)

- Summarized view of resource utilization, including CLBs.

## Pin Configuration

![Pin Configuration](./img/fitter_report_pin_in_pin_out.png)

- Explore input and output configurations.

## PLL Configuration

![PLL Configuration](./img/fitter_report_pll.png)

- Understand PLL configuration.

## Resource Utilization by Entity

![Resource Utilization by Entity](./img/fitter_resource_utilization_by_entity.png)

- Breakdown of resources used by each entity.

## Control Signals

![Control Signals](./img/fitter_resource_control_signals.png)

- Signals controlling registers in your design (e.g., clk, rst).

## Global and Fast Signals

![Global and Fast Signals](./img/fitter_report_global_and_other_fast_signals.png)

- Exploration of global and fast signals.
