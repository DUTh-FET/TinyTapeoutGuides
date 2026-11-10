# Digital two-bit unsigned adder — RTL to GDS

This lab uses a **combinational two-bit unsigned adder** to demonstrate an automated SKY130 **standard-cell digital flow**.

## Available teaching documents

- **[Fabrication-flow slides (PDF, 39 pages)](fabrication-flow-slides%201.pdf)** — overview of the toolchain, Tiny Tapeout constraints, synthesis, placement, routing, timing and full GDS inspection.
- **[Detailed fabrication report (HTML)](fabrication-report.html)** — a more technical record of commands, configurations, simulation checks and physical verification. Download and open in a web browser if GitHub displays only the HTML source.

## Flow explained

```text
SystemVerilog
  -> Verilator: core/wrapper simulation
  -> Tiny Tapeout configuration
  -> Yosys: standard-cell synthesis
  -> OpenROAD / LibreLane: floorplan, taps, PDN, placement, routing
  -> OpenSTA: timing analysis
  -> Magic / Netgen: physical verification
  -> KLayout: GDS visual inspection
```

The teaching materials report:

- **16/16** exhaustive RTL simulation cases passing
- **16/16** wrapper simulation cases passing
- A successful automated RTL-to-GDS implementation of a digital **1×1** Tiny Tapeout tile
- **15/15** local Tiny Tapeout precheck tests passing, per the detailed report

These are **results documented by the original experiment**, not independent tests run from this GitHub repository. Official CI and later delivery status should be checked separately.

## Why digital GDS looks much denser than analog

Even a simple adder can appear to occupy nearly the entire tile because the standard-cell flow adds power rails, well taps, endcaps, and filler/decap cells across a regular site grid. By contrast, our two-MOS custom analog inverter has a very small active core inside a larger analog tile.

## Source availability

Both teaching documents are now uploaded. The original RTL (`.sv`), testbenches, flow configuration, run logs, GDS and LEF have **not yet been uploaded** as standalone files. Do not treat the screenshots or HTML report as an editable replacement for those sources. See [upload status](../../docs/UPLOAD_STATUS.md).
