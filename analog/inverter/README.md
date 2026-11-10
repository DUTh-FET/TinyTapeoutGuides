# Custom analog layout: 1.8 V CMOS inverter (SKY130A)

**[Open the illustrated step-by-step student lab guide (PDF)](SKY130_Analog_Inverter_Magic_KLayout_Student_Lab_Guide.pdf)**

The PDF walks through the **Xschem → ngspice → Magic → Netgen → GDS/LEF → KLayout** learning path. It explains each command, distinguishes **Linux terminal** commands from Magic's **Tkcon `%`** commands, and includes troubleshooting from the actual inverter layout exercise.

## Circuit specification

| Parameter | Value |
| --- | --- |
| Supply | 1.8 V |
| PMOS `sky130_fd_pr__pfet_01v8` | W = 2.0 µm, L = 0.15 µm |
| NMOS `sky130_fd_pr__nfet_01v8` | W = 1.0 µm, L = 0.15 µm |
| Tiny Tapeout analog tile | 1×2; 161 × 225.76 µm |
| Analog input | `ua[0]` → `VIN` |
| Analog output | `VOUT` → `ua[1]` |
| Supply/ground | `VDPWR`/`VGND` |

## Recorded verification

The standalone inverter passed DRC and LVS: **`Circuits match uniquely.`** With 10 fF output loading, recorded delays were approximately **48.85/57.66 ps** (`tphl`/`tplh`) before layout and **52.76/62.46 ps** after parasitic extraction.

For the centered Tiny Tapeout wrapper, Magic extraction gave:

```spice
Xinv_layout_clean_0 ua[0] ua[1] VDPWR VGND inv_layout_clean
```

Unused output-type interface pins (`uo_out`, `uio_out`, `uio_oe`) were deliberately connected to `VGND`. The wrapper DRC passed; the exported GDS was re-imported in Magic, passed DRC and yielded the same instance connectivity.

**Design-quality note:** The original verified inverter was near the middle of the tile. A lower-right, analog-pin-aware placement is recommended as an educational optimization exercise, **not as an already verified alternative layout**.

## What students should practice

- Device sizing and pre-layout transient simulation
- Manual device layout, Metal1/2/3/4 routing and via placement
- The difference between **DRC**, **LVS** and **parasitic extraction**
- Hierarchical Magic cells and Tiny Tapeout interface routing
- Exporting and checking **GDS** and **LEF**
- Using KLayout to navigate the final GDS hierarchy and inspect individual MOS devices

## Project source availability

The **PDF guide is uploaded here**, but the original editable Xschem `.sch`, Magic `.mag`, SPICE, GDS and LEF files have not yet been copied into this GitHub project. They are in the lab's `/foss/designs` workspace and can be collected using [the repository script](../../scripts/collect_local_designs.sh).

**Not established as passing:** independent full wrapper LVS and official Tiny Tapeout analog precheck. This repository is educational documentation, not a tapeout submission.
