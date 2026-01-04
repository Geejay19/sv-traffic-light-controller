# Phase 2 — RTL Implementation (FSM Only)

This phase implements the FSM designed in Phase 1 using SystemVerilog.  
The controller manages two traffic lights with priority logic and safe transitions.

## 📘 Files
- **traffic_light_controller.sv**  
  RTL implementation of the FSM using enumerated states, synchronous logic, and combinational next-state logic.

- **testbench_for_traffic_light_controller.sv**  
  Testbench used to simulate and verify the FSM behavior.

## 🎯 Features Implemented
- Moore FSM architecture
- Four-state traffic light controller
- Priority handling for Traffic Light A
- Amber state behavior controlled by `timer_done` input
- Clean and modular SystemVerilog coding style

## 🧪 Simulation
You can run the testbench using ModelSim, QuestaSim, or Icarus Verilog.

Example (ModelSim):
`vlog *.sv vsim testbench_for_traffic_light_controller run -al`


This phase verifies the correctness of the FSM before integrating the external timer in Phase 3.
