# 🚦 Traffic Light Controller System (SystemVerilog)  
### **Multi‑Phase Digital Design Project | FSM + Timer + Hierarchical RTL**

This repository contains a complete multi‑phase SystemVerilog implementation of a **traffic light controller**.  
The project demonstrates real digital design engineering practices including:

- FSM architecture  
- Moore machine design  
- RTL implementation  
- Hierarchical module design  
- Nested down‑counter timer  
- Testbench development  
- Simulation‑driven verification  

The system models a realistic two‑road junction with priority logic, amber‑light timing, and safe state transitions.

---
# 📁 **Repository Structure**

```
traffic-light-controller/
│
├── phase1_fsm_design/
│   ├── Analysis_of_the_System.pdf
│   ├── README.md
│
├── phase2_rtl_implementation/
│   ├── traffic_light_controller.sv
│   ├── testbench_for_traffic_light_controller.sv
│   ├── README.md
│
├── phase3_external_timer/
│   ├── traffic_light_controller.sv
│   ├── external_timer.sv
│   ├── down_counter.sv
│   ├── testbench_for_traffic_light_controller.sv
│   ├── README.md
│
└── README.md   ← main project documentation
```
---

## 📌 **Project Phases**

### **🔹 Phase 1 — FSM Design & System Analysis**
Folder: `phase1_fsm_design/`

Includes:
- System analysis  
- FSM type justification  
- State diagram  
- State transition table  

File:
- `Analysis_of_the_System.pdf`

---

### **🔹 Phase 2 — RTL Implementation (FSM Only)**
Folder: `phase2_rtl_implementation/`

Implements the FSM in SystemVerilog using:
- Enumerated states  
- Synchronous state transitions  
- Combinational next‑state logic  
- Output logic based on state encoding  

Files:
- `traffic_light_controller.sv`  
- `testbench_for_traffic_light_controller.sv`

---

### **🔹 Phase 3 — External Timer + Integrated System**
Folder: `phase3_external_timer/`

Adds a hierarchical **nested down‑counter timer** to generate a 7.5‑second amber duration.

Includes:
- Millisecond down counter  
- Seconds down counter  
- Timer top module  
- Integrated traffic light controller  
- Full testbench  

Files:
- `down_counter.sv`  
- `external_timer.sv`  
- `traffic_light_controller.sv`  
- `testbench_for_traffic_light_controller.sv`

---

## 🧠 **System Overview**

The controller manages two traffic lights:

<img width="498" height="391" alt="image" src="https://github.com/user-attachments/assets/f8c809e1-bfa9-44a6-96fd-f8d0e6468e5f" />

- **Traffic Light A** — priority road  
- **Traffic Light B** — secondary road  

Key rules:
- Both lights must never be green simultaneously  
- A has priority over B  
- Amber duration is controlled by an external timer  
- Traffic_B input determines when priority shifts  
- Amber state ignores traffic_B changes  
- Safe transitions between states  

---

## 🛠️ Traffic light controller I/O

<img width="680" height="317" alt="image" src="https://github.com/user-attachments/assets/5615abff-4c14-44ab-a127-0be3e8ca19eb" />

## 🔧 I/O Signal Reference

| Signal           | Type   | Description                                                  |
|------------------|--------|--------------------------------------------------------------|
| `clock`          | input  | Clock signal                                                 |
| `traffic_B`      | input  | 1: traffic in B and not in A; 0: traffic in A or not in B    |
| `timer_done`     | input  | 1: timer is done; 0: timer is ongoing                        |
| `amber_timer_en` | output | Enables the amber timer in the external timer module         |
| `red_light_A`    | output | Controls red light in traffic light A                        |
| `amber_light_A`  | output | Controls amber light in traffic light A                      |
| `green_light_A`  | output | Controls green light in traffic light A                      |
| `red_light_B`    | output | Controls red light in traffic light B                        |
| `amber_light_B`  | output | Controls amber light in traffic light B                      |
| `green_light_B`  | output | Controls green light in traffic light B                      |

---

## 🔄 **FSM States**

| State | Code | Meaning |
|-------|------|---------|
| `GARB` | `00` | A = Green, B = Red |
| `AARB` | `01` | A = Amber, B = Red |
| `RAGB` | `10` | A = Red, B = Green |
| `RAAB` | `11` | A = Red, B = Amber |

---

## 🧩 **Why a Moore FSM?**

A Moore FSM is used because:

- Amber duration must be **exactly k cycles**  
- Outputs must remain stable throughout the state  
- Avoids glitches caused by Mealy output changes  
- Ensures deterministic timing with the external timer  

---

## 🧪 **Simulation**

Each phase includes a testbench verifying:

- State transitions  
- Timer behavior  
- Priority logic  
- Amber timing  
- Illegal state avoidance  

---

## 🧭 **How to Run Simulations**

### ModelSim / QuestaSim
```
vlog *.sv
vsim testbench_for_traffic_light_controller
run -all
```

### Icarus Verilog
```
iverilog -o sim *.sv
vvp sim
```

---

## 🎯 **Skills Demonstrated**

- FSM design  
- SystemVerilog RTL coding  
- Hierarchical module design  
- Timer design using nested counters  
- Testbench creation  
- Simulation‑based verification  
- Clean digital design documentation  

---


