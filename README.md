# Tiny Tapeout & Open-Source ASIC Design Guides

**DUTh-FET teaching repository** for two SKY130 learning paths:

- **Custom analog:** 1.8 V CMOS inverter using Xschem, ngspice, Magic, Netgen, and KLayout.
- **Digital:** two-bit unsigned adder using SystemVerilog, Verilator, Yosys, OpenROAD/LibreLane, Magic, Netgen, and KLayout.

## Learning paths

| Path | Guide | Implementation |
| --- | --- | --- |
| [Analog inverter](analog/inverter/README.md) | Step-by-step schematic, simulation, manual layout, DRC, LVS, PEX and Tiny Tapeout integration | Custom MOS devices; 1×2 analog tile |
| [Digital 2-bit adder](digital/adder2/README.md) | RTL verification, synthesis, floorplanning, power grid, place-and-route, timing and GDS | Standard-cell digital 1×1 tile |
| [Setup](docs/setup.md) | Docker, SKY130 and tool launch commands | IIC-OSIC-TOOLS |
| [References](docs/references.md) | Tools and external examples | Links only; no third-party sources copied |

## Project status

**Analog:** standalone inverter DRC/LVS passed; PEX and post-layout simulation performed; centered Tiny Tapeout 1×2 wrapper DRC passed; extracted connectivity was `Xinv_layout_clean_0 ua[0] ua[1] VDPWR VGND inv_layout_clean`. GDS exported and re-imported into Magic with clean DRC and equivalent connectivity. An alternative lower-right core placement was proposed for teaching, **not verified**.

**Digital:** the provided adder reports document exhaustive RTL/wrapper testing and a digital RTL-to-GDS flow, including local precheck. See the report for the exact tool outputs and any remaining official CI work.

**Publication note:** This course repository is not a Tiny Tapeout submission, and its presence on GitHub is not evidence of official precheck/CI acceptance.

## Local design files

The analog source hierarchy, GDS, LEF, schematic and simulation results are located in the lab's Docker workspace under `/foss/designs/inverter` and `/foss/designs/tt_inverter`. They must be copied **from that workspace**; no fabricated or reconstructed source files should replace the verified originals.

The original digital RTL and generated GDS are also to be copied from their source workspace, not reverse-engineered from the report.

After checking the local files, the course maintainer can use `scripts/collect_local_designs.sh` to collect them in a separate working copy for upload.

## Project map

```text
analog/inverter/             analog overview, design source files to be collected
digital/adder2/              digital overview, source RTL and output files to be collected
docs/analog/                 illustrated analog lab guide (PDF to upload)
docs/digital/                digital fabrication slides and HTML report (to upload)
docs/setup.md                environment/setup
docs/references.md           original sources and external learning materials
scripts/                    safe local file collection
```

## Educational comparison: analog vs digital physical design

The analog inverter consists of two manually positioned transistors and a small set of routes in a spacious 161 × 225.76 µm tile. A digital adder is mapped to standard cells with automatically inserted well taps, endcaps, filler/decap cells and a power grid. Therefore the digital GDS looks dense, while the analog GDS looks sparse. **Visual density alone never proves correctness**; use simulation, DRC, LVS, timing checks, and appropriate extraction.

## Reuse and credit

References remain links to their original authors. For course-uploaded materials, verify permissions and add a suitable project license before making this repository public.
