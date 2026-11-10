# Custom analog layout: CMOS inverter (SKY130A)

This laboratory follows a two-transistor 1.8 V CMOS inverter from Xschem/ngspice to Magic, Netgen, parasitic extraction, Tiny Tapeout analog integration, GDS export and KLayout inspection.

**PMOS:** W = 2.0 µm, L = 0.15 µm. **NMOS:** W = 1.0 µm, L = 0.15 µm. **Analog tile:** 1×2, 161 × 225.76 µm.

## Functional connections

```text
ua[0]  --> VIN
ua[1]  <-- VOUT
VDPWR  --> VDD
VGND   --> GND
```

The extracted wrapper contained:

```spice
Xinv_layout_clean_0 ua[0] ua[1] VDPWR VGND inv_layout_clean
```

Unused digital outputs (`uo_out`, `uio_out`, `uio_oe`) were physically tied to ground.

## Recorded checks

- Standalone DRC clean and LVS: `Circuits match uniquely.`
- Pre-layout delay at 1.8 V, 10 fF: `tphl ≈ 48.85 ps`, `tplh ≈ 57.66 ps`.
- Post-layout: `tphl ≈ 52.76 ps`, `tplh ≈ 62.46 ps`.
- Centered wrapper source DRC clean; GDS round-trip DRC clean.
- After GDS re-import, extraction still recovered the same inverter instance and port connections.

**Important:** A lower-right placement near the analog pins was proposed as an improvement but was *not* established as fully verified. Only the centered version has the reported checks.

## Source and learning guide

The student PDF guide belongs at `docs/analog/SKY130_Analog_Inverter_Magic_KLayout_Student_Lab_Guide.pdf`. The original `.mag`, `.gds`, `.lef`, `.sch`, and simulation sources must be copied from the verified lab machine using `scripts/collect_local_designs.sh` and reviewed before publication. The absence of these files in this repo does **not** imply the files have been generated here.

Official Tiny Tapeout precheck and independent wrapper-level LVS have not been established as passing.
