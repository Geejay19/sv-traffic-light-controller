# Phase 3 — External Timer + Integrated System

This phase adds a hierarchical external timer module to generate the required 7.5-second amber duration.  
The timer is integrated with the traffic light controller to create a complete working system.

## 📘 Files
- **down_counter.sv**  
  A reusable down-counter module used inside the timer.

- **external_timer.sv**  
  Nested counter module that generates a 7.5-second delay using a 100 ms clock.

- **traffic_light_controller.sv**  
  Updated controller that interfaces with the external timer.

- **testbench_for_traffic_light_controller.sv**  
  Testbench verifying the integrated system.

## 🎯 Timer Design
- Clock period: **100 ms**
- Total amber duration: **7.5 seconds**
- Nested counters:
  - Millisecond counter
  - Seconds counter
- `timer_done` asserted when countdown completes
- Automatically resets for next amber cycle

## 🧪 Simulation
Run the provided testbench to verify:
- Correct amber timing
- Proper state transitions
- Integration between FSM and timer
- No illegal states

This phase completes the full traffic light controller system.
