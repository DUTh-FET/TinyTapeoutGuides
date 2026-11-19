# Two-stage CMOS operational amplifier — preparation workspace

**Status: DRAFT / reference topology only. Not an implemented, simulated or validated circuit.**

This is a reproducible starting point for a future SKY130A implementation. The exact Xschem schematic and specifications are **not yet supplied**, so this directory deliberately contains **no guessed netlist, transistor sizing, simulated results, or layout claims**.

## Reference circuit

The supplied drawing is an eight-transistor, **two-stage Miller-compensated CMOS op-amp**:

| Component | Provisional role in the reference drawing |
| --- | --- |
| M1, M2 | PMOS differential input pair |
| M3, M4 | NMOS current-mirror active load for the first gain stage |
| M5 | PMOS current-source bias for the input stage |
| M6 | NMOS second-stage common-source gain transistor |
| M7 | PMOS second-stage load/bias transistor |
| M8 | Diode-connected PMOS bias reference |
| I_BIAS | Reference bias-current source |
| C_C | Miller compensation capacitor between the first-stage high-impedance node and output |

The diagram is a **reference**, not an approved implementation. Confirm the final Xschem connectivity, input polarity, bulk connections, current-mirror scaling and bias branches before netlisting.

## Starting structure

```text
analog/two_stage_opamp/
  README.md
  specs/
    targets.yaml                planned performance goals (unknowns = null)
    device_parameters.csv       M1...M8 sizing and matching placeholders
    params.template.spice       illustrative bias/parameter syntax; NOT a testbench
  xschem/
    README.md                   import/checklist for final schematic
  sim/
    README.md                   planned DC / AC / transient / corner tests
  layout/
    README.md                   matching / DRC / LVS / PEX stages
```

## Workflow milestones

1. **Freeze the circuit connectivity.** Copy the final `.sch` to `xschem/`, compare M1–M8 to the reference and identify true net names/polarity.
2. **Record technology and requirements.** Complete `specs/targets.yaml`; decide single versus split supply, input common-mode range, output loading, allowable current, gain, bandwidth and stability.
3. **Parameterize in Xschem.** Replace literal transistor dimensions, bias current, and capacitor values by named parameters. Use shared variables for deliberately matched devices, separate variables for required mirror ratios.
4. **Get a correct operating point.** Check first- and second-stage current, device saturation/headroom, reference bias, and quiescent output voltage.
5. **Functional characterization.** Run closed-loop DC transfer, small-signal frequency response / loop gain, transient response, compensation, supply/current sweeps and PVT corners.
6. **Custom physical design.** Make matching-oriented placement, route supplies, integrate physical compensation capacitor, run Magic DRC, Netgen LVS, extraction and post-layout simulation.
7. **Optional Tiny Tapeout integration.** Decide analog tile/interface based on the actual number of analog inputs/outputs and current shuttle specification; do not automatically reuse the inverter's 1×2 pin assignment.

## Critical electrical constraint

For an implementation using the standard SKY130 **1.8 V** core MOS devices, the diagram's `VDD` / `-VSS` labels must **not** be interpreted as `+1.8 V` and `-1.8 V` simultaneously (a 3.6 V span). A starting *single-supply candidate* is `VDD=1.8 V`, `VSS=0 V` with common-mode near mid-supply, **subject to confirmation**. Alternatively `+0.9/-0.9 V` gives a 1.8 V span if a split-supply environment is needed. Verify all terminal voltages and body connections against the PDK model limits.

For model-valid voltage ranges, see [the official SKY130 device details](https://skywater-pdk.readthedocs.io/en/main/rules/device-details.html).

## Working locally

The existing IIC-OSIC-TOOLS configuration mounts `~/eda/designs` into the container as `/foss/designs`. After pulling this GitHub repo, access the new folder at:

```bash
cd /foss/designs/TinyTapeoutGuides/analog/two_stage_opamp
```

To launch Xschem later in the same VNC terminal:

```bash
sak-pdk sky130A
cd xschem
xschem
```

Do not run a SPICE simulation until the final transistor-level source and all required parameters are defined. That avoids presenting default guesses as verified design data.
